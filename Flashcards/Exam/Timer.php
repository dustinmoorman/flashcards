<?php

namespace Flashcards\Exam;

class Timer
{
	protected static $time;

	public static function start()
	{
		list($usec, $sec) = self::getTime();
		self::$time = (float) $sec + (float) $usec;
	}

	public static function stop()
	{
		list($usec, $sec) = self::getTime();
		return round(((float) $sec + (float) $usec) - self::$time, 2); 
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
