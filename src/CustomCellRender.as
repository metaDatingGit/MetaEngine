﻿package  {		import fl.controls.ComboBox;    import fl.controls.List;	import flash.text.TextFormat;		public class CustomCellRender extends ComboBox {		public function CustomCellRender() 		{			super();				textFormat = new TextFormat(”Arial”, 10, 0xffffff);					//textField is the top text, in the closed combobox			textField.setStyle(”embedFonts”, true);			textField.setStyle(”textFormat”, textFormat);					//dropdown is the list that shows when you open the combobox			dropdown.setStyle(”cellRenderer”, CustomCellRenderer);			// constructor code		}		   		private var textFormat:TextFormat;				override protected function drawLayout():void		{			super.drawLayout();			textField.y = 0;		}	}	}