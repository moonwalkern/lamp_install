echo "Creating new host"
read -p "Enter Host name :" vhost
vhost_name="$vhost.conf"
echo "Creating new host $vhost_name"
vhost_path="/etc/apache2/sites-available/$vhost_name"
echo $vhost_path
cp 000-default.conf $vhost_path
server_email="$vhost@gmail.com"
server_name="$vhost"
server_alias="$vhost"
server_doc_path="/var/www/html/$vhost/public_html"
server_doc_path_escape="\/var\/www\/html\/$vhost\/public_html"
echo "Creating host folders $server_doc_path"
mkdir -p $server_doc_path
sed -ie "s/server_email/$server_email/g" $vhost_path
sed -ie "s/server_name/$server_name/g" $vhost_path
sed -ie "s/server_alias/$server_alias/g" $vhost_path
sed -ie "s/path/$server_doc_path_escape/g" $vhost_path
echo "127.0.0.1	$vhost" >> /etc/hosts
a2dissite 000-default.conf
sudo a2ensite $vhost_name
systemctl restart apache2
echo "New virtual host $vhost_name is created"
