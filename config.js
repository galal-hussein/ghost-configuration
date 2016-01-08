// # Ghost Configuration
// Setup your Ghost install for various [environments](http://support.ghost.org/config/#about-environments).

// Ghost runs in `development` mode by default. Full documentation can be found at http://support.ghost.org/config/

var path = require('path'),
    config;

config = {
    // ### Production
    // When running Ghost in the wild, use the production environment.
    // Configure your URL and mail settings here
    production: {
        url: 'http://my-ghost-blog.com',
        mail: {},
        database: {
            client: 'mysql',
 	    connection: {
    		host     : 'mysql',
    		user     : 'admin',
    		password : 'ghost_password',
    		database : 'ghost_db',
    		charset  : 'utf8'
	    },
            debug: false
        },

        server: {
            host: '0.0.0.0',
            port: '2368'
        }
}
};
    
module.exports = config;
