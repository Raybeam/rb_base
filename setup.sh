apt-get -y update

apt-get -y install build-essential

# Install ruby 2.0
ruby_version=`ruby --version`
if [[ "$ruby_version" != "ruby 2.0.0p0 (2013-02-24 revision 39474) [i686-linux]" ]]; then
  cd /tmp
  wget -nv ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
  tar zxvf ruby-2.0.0-p0.tar.gz
  cd ruby-2.0.0-p0
  ./configure
  make
  make install
else
  echo "  ** ** Ruby already installed "
fi

# Install latest redis
if [[ ! -f /usr/local/bin/redis-server ]]; then
  cd /tmp
  wget http://download.redis.io/redis-stable.tar.gz
  tar xvzf redis-stable.tar.gz
  cd redis-stable
  make
  make install
  cd utils
  yes | ./install_server.sh
else
  echo " * * * * * Redis already installed "
fi

# Install latest postgres
if [[ ! -f /usr/lib/postgresql/9.2/bin/psql ]]; then
  apt-get -y install python-software-properties
  add-apt-repository ppa:pitti/postgresql
  apt-get update
  apt-get -y install postgresql-9.2
  apt-get -y install postgresql-server-dev-9.2

  sudo -u postgres createuser --superuser vagrant
  sudo -u postgres psql -c "alter user vagrant with password ''"
  sudo -u postgres psql -c "create database vagrant"
else
  echo " * ** * * PSQL installed"
fi

mysql_version=`mysql --version`
# Install mySQL
if [[ "$mysql_version" != "mysql  Ver 14.14 Distrib 5.1.67, for debian-linux-gnu (i486) using readline 6.1" ]]; then
  DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server-5.1
  apt-get -y install libmysqlclient-dev
else
  echo " * * * * mySQL installed"
fi

apt-get -y install 'libxslt-dev'
apt-get -y install 'libxml2-dev'

gem install bundler

# cd /bi/checky
# sudo -u vagrant bundle install --path=/tmp/vendor --binstubs


