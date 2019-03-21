function   plotmovie(ordinate,sig)

%	PLOTMOVIE plots each row of a matrix until done.  
%	use form   plotmovie([ordinate,]sig)   with ordinate being optional
%	if there is single argument and sig is not complex, plots  values versus index
%	if there is single argument and sig is complex, plots  imaginary versus real
%	if there are two arguments, plots  sig values versus ordinate 
%	if either argument is complex the program first converts to absolute values
%	if ordinate is a vector, each plot is sig value versus ordinate
%		from Robert A Macy 		macy ..AT.. california ..DOT.. com

if (nargin==0)
  help plotmovie;
  return;
endif

if (nargin>2)
  errormsg="too many arguments"
  return;
endif

if (nargin==1)
  sig=ordinate;
  [rowssig,columnssig]=size(sig);
  if (rowssig<2)
    errormsg="need more than 1 row"
    return;
  endif
  if (iscomplex(sig)==1)
    ordinate=real(sig);sig=imag(sig);
    x1=min(min(ordinate));x2=max(max(ordinate));
  else  ordinate=ones(rowssig,1)*[(1:columnssig)];x1=0;x2=columnssig;
  endif
%	find maximum plot sizes:
  y1=min(min(sig));y2=max(max(sig));
  cmdstr=(sprintf("gset xrange [%e:%e];\n",x1,x2));eval(cmdstr);
  cmdstr=(sprintf("gset yrange [%e:%e];\n",y1,y2));eval(cmdstr);
  plot(ordinate(1,:),sig(1,:));
  for i=2:rowssig
    plot(ordinate(i,:),sig(i,:));
  endfor
  gset autoscale;
  return;
endif

if (nargin==2)
  [rowssig,columnssig]=size(sig);
  [rowsord,columnsord]=size(ordinate);
  if (columnssig != columnsord)
    errormsg="arguments are not equal in number of columns"
    return;
  endif
  if (rowsord==1)
    ordinate=ones(rowssig,1)*ordinate;rowsord=rowssig;
  endif
  if (rowsord != rowssig)
    errormsg="arguments are not equal in number of rows"
    return;
  endif
  if (iscomplex(sig)==1)
    sig=abs(sig);
  endif
  if (iscomplex(ordinate)==1)
    ordinate=abs(ordinate);
  endif
  if (rowssig<2)
    errormsg="need more than 1 row"
    return;
  endif
%	find maximum plot sizes:
  x1=min(min(ordinate));x2=max(max(ordinate));
  y1=min(min(sig));y2=max(max(sig));
  cmdstr=(sprintf("gset xrange [%e:%e];\n",x1,x2));eval(cmdstr);
  cmdstr=(sprintf("gset yrange [%e:%e];\n",y1,y2));eval(cmdstr);
  plot(ordinate(1,:),sig(1,:));
  for i=2:rowssig
    plot(ordinate(i,:),sig(i,:));
  endfor
  gset autoscale;
  return;
endif

gset autoscale;

