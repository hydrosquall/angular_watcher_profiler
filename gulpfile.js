var gulp = require('gulp');
var args = require('yargs').argv;         // get all arguments
// var config = require('./gulp.config')();  // need to invoke to use object. JS out.
var del  = require('del');                        // is a node module, no filestream needed
var path = require('path');                       // Native to node for path joining
var $ = require('gulp-load-plugins')({lazy: true});

gulp.task('help', $.taskListing);
gulp.task('default', ['help']);


gulp.task('coffee', function() {

  gulp.src('./src/*.coffee')
    .pipe($.plumber())
    .pipe($.coffee({bare: true}))
    .pipe(gulp.dest('./tmp/'));
});

gulp.task('minify-js', function() {
  gulp.src('./tmp/*.js')
    .pipe($.plumber())
    .pipe($.uglify().on('error', $.util.log))
    .pipe(gulp.dest('./public/'));
});

gulp.task('clean-all', function() {
    del('./tmp/');
});

// Main Build Task
gulp.task('build', ['clean-all', 'coffee', 'minify-js'], function() {
  $.util.log('Completed build!');
});

// Create bookmarks page
gulp.task('bookmark', ['build'], function() {
  gulp.src('./tmp/*.js')
    .pipe($.plumber())
    .pipe($.bookmarklet({
      format: 'html',
      filename: 'bookmarkPage'
    }))
    .pipe(gulp.dest('./public/'));
});