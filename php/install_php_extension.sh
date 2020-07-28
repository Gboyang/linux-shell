#!/bin/bash
ifsuse=$(cat /proc/version | grep -i suse)

if [ `uname -m` == "x86_64" ];then
machine=x86_64
else
machine=i686
fi

#memcache
if [ ! -f memcache-3.0.6.tgz ];then
	wget http://oss.aliyuncs.com/aliyunecs/onekey/php_extend/memcache-3.0.6.tgz
fi
rm -rf memcache-3.0.6
tar -xzvf memcache-3.0.6.tgz
cd memcache-3.0.6
/server/php/bin/phpize
./configure --enable-memcache --with-php-config=/server/php/bin/php-config
CPU_NUM=$(cat /proc/cpuinfo | grep processor | wc -l)
if [ $CPU_NUM -gt 1 ];then
    make -j$CPU_NUM
else
    make
fi
make install
cd ..
echo "extension=memcache.so" >> /server/php/etc/php.ini

#zend
if ls -l /server/ |grep "5.3.29" > /dev/null;then
  mkdir -p /server/php/lib/php/extensions/no-debug-non-zts-20090626/
  if [ $machine == "x86_64" ];then
	  if [ ! -f ZendGuardLoader-php-5.3-linux-glibc23-x86_64.tar.gz ];then
		wget http://oss.aliyuncs.com/aliyunecs/onekey/php_extend/ZendGuardLoader-php-5.3-linux-glibc23-x86_64.tar.gz
	  fi
	  tar zxvf ZendGuardLoader-php-5.3-linux-glibc23-x86_64.tar.gz
	  mv ./ZendGuardLoader-php-5.3-linux-glibc23-x86_64/php-5.3.x/ZendGuardLoader.so /server/php/lib/php/extensions/no-debug-non-zts-20090626/
  else
      if [ ! -f ZendGuardLoader-php-5.3-linux-glibc23-i386.tar.gz ];then
        wget http://oss.aliyuncs.com/aliyunecs/onekey/php_extend/ZendGuardLoader-php-5.3-linux-glibc23-i386.tar.gz
	  fi
	  tar zxvf ZendGuardLoader-php-5.3-linux-glibc23-i386.tar.gz
	  mv ./ZendGuardLoader-php-5.3-linux-glibc23-i386/php-5.3.x/ZendGuardLoader.so /server/php/lib/php/extensions/no-debug-non-zts-20090626/
  fi
  echo "zend_extension=/server/php/lib/php/extensions/no-debug-non-zts-20090626/ZendGuardLoader.so" >> /server/php/etc/php.ini
  echo "zend_loader.enable=1" >> /server/php/etc/php.ini
  echo "zend_loader.disable_licensing=0" >> /server/php/etc/php.ini
  echo "zend_loader.obfuscation_level_support=3" >> /server/php/etc/php.ini
  echo "zend_loader.license_path=" >> /server/php/etc/php.ini 
elif ls -l /server/ |grep "5.4.23" > /dev/null;then
  mkdir -p /server/php/lib/php/extensions/no-debug-non-zts-20100525/
  if [ $machine == "x86_64" ];then
	  if [ ! -f ZendGuardLoader-70429-PHP-5.4-linux-glibc23-x86_64.tar.gz ];then 
		wget http://oss.aliyuncs.com/aliyunecs/onekey/php_extend/ZendGuardLoader-70429-PHP-5.4-linux-glibc23-x86_64.tar.gz
	  fi
	  tar zxvf ZendGuardLoader-70429-PHP-5.4-linux-glibc23-x86_64.tar.gz
	  mv ./ZendGuardLoader-70429-PHP-5.4-linux-glibc23-x86_64/php-5.4.x/ZendGuardLoader.so /server/php/lib/php/extensions/no-debug-non-zts-20100525/
  else
      if [ ! -f ZendGuardLoader-70429-PHP-5.4-linux-glibc23-i386.tar.gz ];then 
		wget http://oss.aliyuncs.com/aliyunecs/onekey/php_extend/ZendGuardLoader-70429-PHP-5.4-linux-glibc23-i386.tar.gz
	  fi
	  tar zxvf ZendGuardLoader-70429-PHP-5.4-linux-glibc23-i386.tar.gz
	  mv ./ZendGuardLoader-70429-PHP-5.4-linux-glibc23-i386/php-5.4.x/ZendGuardLoader.so /server/php/lib/php/extensions/no-debug-non-zts-20100525/
  fi
  echo "zend_extension=/server/php/lib/php/extensions/no-debug-non-zts-20100525/ZendGuardLoader.so" >> /server/php/etc/php.ini
  echo "zend_loader.enable=1" >> /server/php/etc/php.ini
  echo "zend_loader.disable_licensing=0" >> /server/php/etc/php.ini
  echo "zend_loader.obfuscation_level_support=3" >> /server/php/etc/php.ini
  echo "zend_loader.license_path=" >> /server/php/etc/php.ini 
elif ls -l /server/ |grep "5.2.17" > /dev/null;then
  mkdir -p /server/php/lib/php/extensions/no-debug-non-zts-20090626/
  if [ $machine == "x86_64" ];then
	  if [ ! -f ZendOptimizer-3.3.9-linux-glibc23-x86_64.tar.gz ];then 
		 wget http://zy-res.oss-cn-hangzhou.aliyuncs.com/php-5.2/ZendOptimizer-3.3.9-linux-glibc23-x86_64.tar.gz
	  fi
	  tar zxvf ZendOptimizer-3.3.9-linux-glibc23-x86_64.tar.gz
      mv ./ZendOptimizer-3.3.9-linux-glibc23-x86_64/data/5_2_x_comp/ZendOptimizer.so  /server/php/lib/php/extensions/no-debug-non-zts-20090626/
  else
      if [ ! -f ZendOptimizer-3.3.9-linux-glibc23-i386.tar.gz ];then 
		wget http://zy-res.oss-cn-hangzhou.aliyuncs.com/php-5.2/ZendOptimizer-3.3.9-linux-glibc23-i386.tar.gz
	  fi
	  tar zxvf ZendOptimizer-3.3.9-linux-glibc23-i386.tar.gz
	  mv ./ZendOptimizer-3.3.9-linux-glibc23-i386/data/5_2_x_comp/ZendOptimizer.so /server/php/lib/php/extensions/no-debug-non-zts-20100525/
  fi
  echo "[zend]" >> /server/php/etc/php.ini
  echo "zend_optimizer.optimization_level=1023" >> /server/php/etc/php.ini
  echo "zend_optimizer.encoder_loader=1"        >> /server/php/etc/php.ini
  echo "zend_extension=/server/php/lib/php/extensions/no-debug-non-zts-20090626/ZendOptimizer.so" >> /server/php/etc/php.ini
elif ls -l /server/ |grep "5.5.7" > /dev/null;then
  mkdir -p /server/php/lib/php/extensions/no-debug-non-zts-20121212/
  if [ $machine == "x86_64" ];then
	wget http://zy-res.oss-cn-hangzhou.aliyuncs.com/php/zend/zend-loader-php5.5-linux-x86_64.tar.gz
	tar zxvf zend-loader-php5.5-linux-x86_64.tar.gz
	mv ./zend-loader-php5.5-linux-x86_64/ZendGuardLoader.so /server/php/lib/php/extensions/no-debug-non-zts-20121212/
else
    wget http://zy-res.oss-cn-hangzhou.aliyuncs.com/php/zend/zend-loader-php5.5-linux-i386.tar.gz
	tar zxvf zend-loader-php5.5-linux-i386.tar.gz
	mv ./zend-loader-php5.5-linux-i386/ZendGuardLoader.so /server/php/lib/php/extensions/no-debug-non-zts-20121212/
fi
  echo "zend_extension=/server/php/lib/php/extensions/no-debug-non-zts-20121212/ZendGuardLoader.so" >> /server/php/etc/php.ini
  echo "zend_loader.enable=1" >> /server/php/etc/php.ini
  echo "zend_loader.disable_licensing=0" >> /server/php/etc/php.ini
  echo "zend_loader.obfuscation_level_support=3" >> /server/php/etc/php.ini
  echo "zend_loader.license_path=" >> /server/php/etc/php.ini
fi



#opensuse_memcache
if [ "$ifsuse" != "" ];then
	ln -s /server/php/lib64/extensions/no-debug-non-zts-20100525/memcache.so  /server/php/lib/php/extensions/no-debug-non-zts-20100525/memcache.so
	ln -s /server/php/lib64/extensions/no-debug-non-zts-20121212/*  /server/php/lib/php/extensions/no-debug-non-zts-20121212/
fi
