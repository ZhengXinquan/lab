@echo off  
set php_home=C:\Huweishen.com\PHPWEB\php
set nginx_home=C:\MyProgram\nginx
  
REM Windows ����Ч  
REM set PHP_FCGI_CHILDREN=5  
  
REM ÿ�����̴���������������������Ϊ Windows ��������  
set PHP_FCGI_MAX_REQUESTS=1000  
  
echo Starting PHP FastCGI...  
RunHiddenConsole.exe xxfpm.exe "%php_home%\php-cgi.exe -c %php_home%\php.ini" -n 8 -i 172.18.52.207 -p 9010
   
echo Starting nginx...  
RunHiddenConsole %nginx_home%\nginx.exe -p %nginx_home%  