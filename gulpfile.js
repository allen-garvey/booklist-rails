"use strict";

var gulp = require('gulp');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var rename = require('gulp-rename');
var maps = require('gulp-sourcemaps');

var JS_SOURCE_DIR = 'app/assets/js_source/';
var JS_DEST_DIR = 'app/assets/javascripts/';
var DIST_NAME = 'app'; //name of compiled file to be served i.e. app.js and app.min.js

gulp.task('concatScripts', function(){
	return gulp.src(['util', 'modal', 'index_filter', 'delete_confirm_popup', 'barcode_popup'].map(function(file){return JS_SOURCE_DIR + file + '.js';}))
		.pipe(maps.init())
		.pipe(concat(DIST_NAME + '.js'))
		.pipe(maps.write('./'))
		.pipe(gulp.dest(JS_DEST_DIR));
});

gulp.task('minifyScripts', ['concatScripts'], function(){
	return gulp.src(JS_DEST_DIR + DIST_NAME + '.js')
		.pipe(uglify())
		.pipe(rename(DIST_NAME + '.min.js'))
		.pipe(gulp.dest(JS_DEST_DIR));
});
gulp.task('watchScripts', function(){
	gulp.watch('js/**/*.js', ['minifyScripts']);
});

gulp.task('build', ['minifyScripts']);
gulp.task('default', ['build']);
