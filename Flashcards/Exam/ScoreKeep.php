<?php

namespace Flashcards\Exam;

class ScoreKeep 
{
	protected $_questionCount;
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

	public function setQuestionCount($questionCount)
	{
		$this->_questionCount = $questionCount;
	}
}
