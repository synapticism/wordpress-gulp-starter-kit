// ==== FTP ==== //

var gulp        = require('gulp'),
    gutil       = require( 'gulp-util' ),
    ftp         = require ('vinyl-ftp'),
    config      = require('../../gulpconfig').ftp;

// Copy PHP source files to the `build` folder
gulp.task( 'deploy', function () {

    var conn = ftp.create( {
        host:     config.host,
        user:     config.user,
        password: config.password,
        parallel: config.parallel,
        log:      gutil.log
    } );
 
    var globs = [
        config.dist+'/**/*'
    ];

    // using base = '.' will transfer everything to /public_html correctly 
    // turn off buffering in gulp.src for best performance 
 
    return gulp.src( globs, { base: config.dist, buffer: false } )
        .pipe( conn.differentSize( config.dest ) ) // only different sized files
        .pipe( conn.dest( config.dest ) );
 
} );