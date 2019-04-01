## Copyright (C) 2008, 2009 Francesco Potortì

## -*- texinfo -*-
## @deftypefn {Function File} {} movie (@var{action})
## @deftypefnx {Function File} {} movie (@var{action}, @var{mvf})
## @deftypefnx {Function File} {} movie (@var{action}, @var{mvf}, @var{arg})
## Create a movie from plots
##
## Example usage:
## @example
##   figure("visible","off"); movie("init","square.mp4")
##   n=100; a=zeros(n,n); a(1:20,41:60)=1;
##   for i=1:n; imshow(shift(a,i)); movie("add","square.mp4"); endfor
##   movie("close","square.mp4",24); close; system("mplayer square.mp4")
## @end example
##
## @var{action} takes one of three string values: @code{init},
## @code{add}, @code{close}. For each, @var{mvf} specifies the file name
## produced; the file name suffix sets the type of movie.
##
## If @var{mvf} is missing, it defaults to @file{octave_movie.mp4}. The
## suffix @file{.dir} creates a directory containing a png file per
## frame, the type @file{.zip} archives it using @command{zip}.  A
## suffix of @file{.mp4}, @file{.ogg}, @file{.mov}, @file{.mjpeg},
## @file{.avi}, @file{.flv} creates a movie using @command{ffmpeg};
## @file{.mng}, @file{.gif} create a movie using @command{convert}; type
## @file{.swf} creates a movie using @command{png2swf}. You must have
## the relevant program installed when using a given extension; no
## program is required for @file{.dir}.
##
## With the @var{init} action, a third arguments specifies the first
## frame number, which defaults to 0.
##
## With the @var{add} action, a third arguments specifies the current
## frame number, which defaults to the previous one plus one.
##
## With the @var{close} action, a third arguments specifies the frame
## rate (defaulting to 5 frames/second).
##
## @end deftypefn

## Author: Francesco Potortì <Potorti@isti.cnr.it>
## $Revision: 1.15 $
## License: GPL version 3 or later

function movie (action, mvf='octave_movie.mp4', arg=NA)

  verbose = false;

  if (nargin == 0)
    print_usage ();
  elseif (nargin >= 2 && !ischar(mvf))
    error("second arg must be a string");
  endif
  [mpath mname mtype] = fileparts(mvf);
  mtype = mtype(2:end);			# remove the initial dot

  mdir = fullfile(mpath, [mname '.d']);
  ppat = '%06d.png';
  mpat = fullfile(mdir, ppat);
  mglob = fullfile(mdir, strrep(sprintf(ppat,0),'0','[0-9]'));
  fnof = fullfile(mdir, "+frame-number+");

  switch (action)

    case "init"				# init a movie
      if (isdir(mvf))
	cleandir(mvf, verbose)
      else
	unlink(mvf);
      endif
      while (!([allgood msg] = mkdir(mdir)))
	if (stat(fnof) && load(fnof).frameno == 0)
	  error("while creating dir '%s': %s", mdir, msg);
	else
	  cleandir(mdir, verbose);
	endif
      endwhile
      if isna(arg)
	frameno = 0;
      else
	frameno = arg;
      endif
      save('-text',fnof,'frameno');
      if (verbose) printf("Directory '%s' created.\n", mdir); endif

    case "add"				# add a frame
      if isna(arg)
	load(fnof);			# read frameno from file
      else
	frameno = arg;
      endif
      pmpat = strrep(mpat, '\', '\\');	# quote backslashes
      mfile = sprintf(pmpat, ++frameno);
      print(mfile,'-dpng');
      save('-text',fnof,'frameno');
      if (verbose) printf("Frame '%s' added.\n", mfile); endif

    case "close"			# close the movie
      if isna(arg)
	rate = 5;
      else
	rate = arg;
      endif
      load(fnof);			# read frameno from file
      switch (mtype)
	case {'mp4', 'ogg', 'mov', 'mjpeg', 'avi', 'flv'}
	  cmd = sprintf("ffmpeg -y -r %d -i %s -qscale 0 %s 2>&1", rate, mpat, mvf);
	case {'mng', 'gif'}
          cmd = sprintf("convert %s -adjoin %s'[1-%d]' %s 2>&1", mglob, mpat, frameno, mvf);
	case 'zip'
	  cmd = sprintf("zip -qr9 %s %s 2>&1", mvf, mglob);
	case 'swf'
	  cmd = sprintf("png2swf -z -r %d -o %s %s", rate, mvf, mglob);
	case 'dir'
	  rename(mdir, mvf); return
	otherwise
	  print_usage();
      endswitch
      if (verbose) printf("\nExecuting %s\n", cmd); endif
      [status output] = system(cmd);
      if (status != 0)
	error("Creation of movie '%s' containing %d frames failed:\n%s",
	      mvf, frameno, output);
      endif
      if (verbose) printf("Movie '%s' contains %d frames:\n%s",
			  mvf, frameno, output); endif
      cleandir(mdir, verbose);

    otherwise
      print_usage();

  endswitch
endfunction


function cleandir(mdir, verbose)
  unwind_protect
    save_crr = confirm_recursive_rmdir(false);
    [allgood msg] = rmdir(mdir,"s");
    if (!allgood)
      error("while removing dir '%s': %s", mdir, msg); endif
  unwind_protect_cleanup
    confirm_recursive_rmdir(save_crr);
  end_unwind_protect
  if (verbose) printf("Directory '%s' removed\n", mdir); endif
endfunction
