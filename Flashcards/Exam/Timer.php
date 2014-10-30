<?php

namespace Flashcards\Exam;

class Timer
{
	protected static $time;

	public static function start()
	{
		list($usec, $sec) = self::getTime();
		$mtime = (float) $sec + (float) $usec;
	}

	public static function stop()
	{
		
	}

	public static function reset()
	{
		self::$time = 0;
	}

	protected static function getTime()
	{
		return explode(' ', microtime());
	}
}
