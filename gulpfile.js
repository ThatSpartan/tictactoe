var gulp = require('gulp');
var plumber = require('gulp-plumber');
var watch = require('gulp-watch');
var batch = require('gulp-batch');
var coffeescript = require('gulp-coffee');
var javascript_obfuscator = require('gulp-javascript-obfuscator');
var concat = require('gulp-concat');
var stylus = require('gulp-stylus');
var mocha = require('gulp-mocha');

gulp.task('javascript', function(){
	gulp.src('./src/*.coffee')
		.pipe(plumber())
		.pipe(coffeescript({ bare: true }))
		.pipe(concat('javascript.js'))
		// .pipe(javascript_obfuscator())
		.pipe(gulp.dest('./puclic/'))
});

gulp.task('coffee', function(){
	gulp.src('./src/*.coffee')
		.pipe(plumber())
		.pipe(coffeescript({ bare: true }))
		.pipe(concat('script.js'))
		.pipe(gulp.dest('./puclic/'))
});

gulp.task('style', function() {
	gulp.src('./src/*.styl')
		.pipe(plumber())
		.pipe(stylus())
		.pipe(gulp.dest('./puclic/'))
});

gulp.task('watch', function () {
	watch('./src/*', batch(function (events, done) {
		gulp.start(['javascript', 'style'], done)
	}));
});

// gulp.task('default', () =>
//     gulp.src('test.js', {read: false})
//         // `gulp-mocha` needs filepaths so you can't have any plugins before it
//         .pipe(mocha({reporter: 'nyan'}))
// );

function handleError(err) {
	// console.log(err.toString());
	this.emit('end');
};

gulp.task('test', function () {
	gulp.src('test/**/*.{js,coffee}', {read: false})
		// .pipe(plumber())
		// .pipe(mocha({reporter: 'nyan', require: ['coffee-script/register']}))
		// .pipe(mocha({require: ['coffee-script/register']}))
		// .pipe(mocha({reporter: 'min', require: ['coffee-script/register']}))
		.pipe(mocha({reporter: 'spec', require: ['coffee-script/register']}))
		.on('error', handleError);
});

gulp.task('testw', function () {
	gulp.watch(['test/*', 'src/*'], ['test']);
});

// gulp.watch(['test/**', 'lib/**'], batch(function (events, cb) {
//     return gulp.src(['test/*.js'])
//         .pipe(mocha({ reporter: 'list' }))
//         .on('error', function (err) {
//             console.log(err.stack);
//         });
// }));

gulp.task('default', [ 'watch' ]);
