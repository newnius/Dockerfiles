# php-apache 5.6

## CHANGELOG
  - remove `Options Indexes` (apache2.conf)
	- remove `Options FollowSymLinks` (apache2.conf)
	- add `Options SymLinksIfOwnerMatch` to support .htaccess (apache2.conf)
	- enable `rewrite` 
	- update to `ServerTokens Prod` (security.conf)
  - update to `ServerSignature Off` (security.conf)
	- add `ServerName localhost` (apache2.conf)
