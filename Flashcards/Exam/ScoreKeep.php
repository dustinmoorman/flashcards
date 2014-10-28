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

	public function getScore()
	{
		return $this->calculatePercentage() 
			. '%, (' 
			. $this->_answeredCorrectlyCount
			. '/'
			. $this->_questionCount
			. ')';
	}

	protected function calculatePercentage()
	{
		if ($this->_questionCount > 0) {
			return round(100 * ($this->_answeredCorrectlyCount / $this->_questionCount), 2);
		} else {
			return 0;
		}
	}
	
	public function getIncorrectlyAnsweredQuestions()
	{
		return $this->_answeredIncorrectly;
	}
}
