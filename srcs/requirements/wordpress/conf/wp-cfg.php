<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
define('DB_NAME', 'wordpress');
define('DB_USER', 'wp_user');
define('DB_PASSWORD', 'wp_password');
define('DB_HOST', 'mariadb');
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');

define( 'WP_ALLOW_REPAIR', true );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '`1yO(@Ja9ZCBKPhpS+$mN@e>Q3[JYnBdvUXDtx#zl$ch #U8I.te2>.B@W0lx]. ');
define('SECURE_AUTH_KEY',  'W&8i1{O5^Ig#+|1g3xhKia(o6VSwq?zfpU%7]B.[|xxAf^R#;.D,3sC~RyfC4%Is');
define('LOGGED_IN_KEY',    ' il]@=JIz^1z~3#L6->h~cH]wSS9`b*|{D6EVdFtAm_-T~0G|n3iuk)i~ L+s#S&');
define('NONCE_KEY',        'Njn+5p!G-:;=&#{|BB-fFRKiizpf2jDUFZQ=fu9|sp<Kv.ToCh)Tbr-c1]OD,f]+');
define('AUTH_SALT',        'I<uwcO|/ro8La=_ IlcA)5,DU,94JEl|C<|7pQYG+4aBm5^*Q7u!g>oR|b@8#v85');
define('SECURE_AUTH_SALT', 'J#yNX6J;uO:h<5(8tFd3%FVI3s`H^tE4d`Q2xC2PipgLfmMYoe+@Yc}#Ipl;Iy4:');
define('LOGGED_IN_SALT',   'B,LI*D[F+|+D8c~NaEg+FW/NqV}!;!k?Q-pI_w>91@$ u3l<}QT{Wj;?al|&&=xd');
define('NONCE_SALT',       '>M3vzLGi=e(LpU4Sve4@1S#O@S[=dq6x)+MA.%{n5xHBC$deYEq$eE#@L]j[/h;M');

$table_prefix = 'wp_';

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>