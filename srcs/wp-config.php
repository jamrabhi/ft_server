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
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'pass' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'Md?<DXY2aE-X y$} 2[bu)(XP[0F2=NUEaN2qRqwu{-dO.-SrXk#QYs+Be{%O9[;' );
define( 'SECURE_AUTH_KEY',  '1DMPiS8M],<77yF*k{}~Qz0K-,Q|b~2U@l7c;#hfT[of*zoju%rJnJMHwy%qE0V[' );
define( 'LOGGED_IN_KEY',    '_saZ@*Z7tmY/x-~V>(2K:[7YmqShkSw^Z.U>3L6qk%7NF#y~7Q`41#?7Eg^NuA.o' );
define( 'NONCE_KEY',        ';vgDMs+X)-qS]8mV!mJ7%:-h*b@A35J:gE-D};Ej/-~jL[:z6gUGm/TTL8dW/&RD' );
define( 'AUTH_SALT',        'kV(rzMoKr*jHOAsG{,;<1:f/Y^/hH,LaDm%$%ICBmN~eEt@I2ZL/VH+J;}]] 6)O' );
define( 'SECURE_AUTH_SALT', 'Hz}UT9Q-w:_p%^-NVy[@U0oQRVsn>xeS6iy0 *IRJUY4)Au!]57kfaCzPow[mY]T' );
define( 'LOGGED_IN_SALT',   'f:6^yHo ;.FI+VW&^4xU*VXmS#|qHq7i.ho(G`#H2n?aRgBb[Z9II+/JUP7%1{SN' );
define( 'NONCE_SALT',       '`=%Zho/Q%>z4:7i6z:ar%bd;tM(r~ii/Y_H:[o+Kz,!(-Xpu7l q|}bC}IdHwirA' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

