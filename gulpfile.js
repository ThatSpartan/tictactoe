var gulp = require('gulp');
var watch = require('gulp-watch');
var batch = require('gulp-batch');
var coffeescript = require('gulp-coffee');

gulp.task('coffee', function(){
	gulp.src('./src/*.coffee')
		.pipe(coffeescript())
		.pipe(gulp.dest('./puclic/'))
});

gulp.task('build', function () { console.log('Working!'); });

gulp.task('watch', function () {
	watch('./src/*.coffee', batch(function (events, done) {
		gulp.start('build', done)
	}));
});

gulp.task('default', [ 'coffee' ]);
