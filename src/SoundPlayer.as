﻿package  {		import flash.net.URLRequest;	import flash.media.Sound;	import flash.media.SoundChannel;	import flash.events.*;	import Utils;	import flash.media.SoundTransform;	//import MetaDating;		public class SoundPlayer {		//--------------------------------------//  PRIVATE VARIABLES//--------------------------------------				private var req:URLRequest;		private var sound:Sound;		private var soundChannel:SoundChannel;		private var bPause:Boolean = false;		private var pausePoint:Number;		private var soundArray:Array;		private var mediaPath:String;		private var idx:int;		private var vol:Number;		private var pathToFiles:String = "media/project_name/";		//--------------------------------------//  CONSTRUCTORS//--------------------------------------		public function SoundPlayer() {			//req = new URLRequest();			sound = new Sound();			soundChannel = new SoundChannel();		}				/*		public function SoundPlayer(theSoundArray:String, theMediaPath:String)		{			soundArray = theSoundArray;			mediaPath = theMediaPath;			sound = new Sound();			soundChannel = new SoundChannel();		}		*/		//--------------------------------------//  PUBLIC METHODS//--------------------------------------		//--------------------------------------				public function playSound(file:String, theVolume:Number = 1.0):void		{			trace("next Sound: " + file);			vol = theVolume;			this.sound.load(new URLRequest(pathToFiles + file));			this.sound.addEventListener(Event.COMPLETE, soundLoaded);		}//--------------------------------------				/*		public function playSound(theIdx:int):void		{			if(soundArray != null && mediaPath != null)			{				idx = theIdx;				this.sound.load(new URLRequest(mediaPath + soundArray[idx]);				this.sound.addEventListener(Event.COMPLETE, soundLoaded);						}		}		*/	//--------------------------------------				public function stopSound():void		{			soundChannel.stop();			//sound.close();		}		//--------------------------------------				public function togglePauseSound():void		{			if(!bPause)			{				pausePoint = soundChannel.position;				soundChannel.stop();				bPause = true;			}			else			{				soundChannel = sound.play(pausePoint, int.MAX_VALUE);				this.setVolume(vol);				bPause = false;				pausePoint = 0;			}		}		//--------------------------------------	public function nextSound(file:String):void	{						this.sound.load(new URLRequest(pathToFiles + file));			this.sound.addEventListener(Event.COMPLETE, soundLoaded);	}	//--------------------------------------	public function previousSound():void	{			}	//--------------------------------------	public function repeatSound():void	{			}	//--------------------------------------	public function setVolume(theVolVal:Number):void	// doesn't work when called from an instance (why?)	{		vol = theVolVal;		var volTransform:SoundTransform = new SoundTransform(theVolVal);		this.soundChannel.soundTransform = volTransform;	}//--------------------------------------//  PRIVATE & PROTECTED INSTANCE METHODS//--------------------------------------		private function soundLoaded(e:Event):void		{						trace("play sound");			this.soundChannel = this.sound.play(0, int.MAX_VALUE); // play parameters tell as3 to start sound from beginning and how often to loop			this.setVolume(vol);		}		//--------------------------------------	}}