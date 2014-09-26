<?php

namespace Flashcards;

class Exam
{
	protected $_questions = [];
	
	public function __construct($questions = [])
	{
		$this->_questions = $questions;
	}

	public function present()
	{
		if (count($this->_questions) > 0) {
			
		}
	}
}
