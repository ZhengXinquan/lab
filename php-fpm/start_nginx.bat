@echo off  
set php_home=C:\Huweishen.com\PHPWEB\php
set nginx_home=C:\MyProgram\nginx
  
REM Windows 下无效  
REM set PHP_FCGI_CHILDREN=5  
  
REM 每个进程处理的最大请求数，或设置为 Windows 环境变量  
set PHP_FCGI_MAX_REQUESTS=1000  
  
echo Starting PHP FastCGI...  
RunHiddenConsole.exe xxfpm.exe "%php_home%\php-cgi.exe -c %php_home%\php.ini" -n 8 -i 172.18.52.207 -p 9010
   
echo Starting nginx...  
RunHiddenConsole %nginx_home%\nginx.exe -p %nginx_home%  