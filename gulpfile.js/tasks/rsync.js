// ==== RSYNC ==== //

var gulp        = require('gulp'),
    config      = require('../../gulpconfig').rsync,
    rsync       = require('gulp-rsync');

gulp.task('rsync', function() {
  return gulp.src(config.dist + '/**')
    .pipe(rsync({
      root: config.dist,
      hostname: config.hostname,
      username: config.username,
      destination: config.destination,
      progress: true
  }));
});