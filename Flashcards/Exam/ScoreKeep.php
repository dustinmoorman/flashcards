<?php

namespace Flashcards\Exam;

class ScoreKeep 
{
	protected $_questionCount = 0;
	protected $_answeredCorrectlyCount = 0;
	protected $_answeredIncorrectly = array();

	public function correct()
	{
		$this->_answeredCorrectlyCount++;
	}

	public function wrong($question)
	{
		$this->_answeredIncorrectly[] = $question;
	}

	public function questionAttempted()
	{
		$this->_questionCount++;
	}
}
