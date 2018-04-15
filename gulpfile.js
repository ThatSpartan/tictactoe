var gulp = require('gulp');
var plumber = require('gulp-plumber');
var watch = require('gulp-watch');
var batch = require('gulp-batch');
var coffeescript = require('gulp-coffee');
var javascript_obfuscator = require('gulp-javascript-obfuscator');
var concat = require('gulp-concat');
var stylus = require('gulp-stylus');

gulp.task('javascript', function(){
	gulp.src('./src/*.coffee')
		.pipe(plumber())
		.pipe(coffeescript({ bare: true }))
		.pipe(concat('javascript.js'))
		.pipe(javascript_obfuscator())
		.pipe(gulp.dest('./puclic/'))
});

gulp.task('style', function() {
	gulp.src('./src/*.coffee')
		.pipe(plumber())
		.pipe(stylus())
		.pipe(gulp.dest('./puclic/'))
});

gulp.task('watch', function () {
	watch('./src/*', batch(function (events, done) {
		gulp.start(['javascript', 'style'], done)
	}));
});

gulp.task('default', [ 'watch' ]);
