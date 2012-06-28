package com.creativebottle.starlingmvc.reflection
{

	/**
	 * Class for tags on a meta class member
	 */
	public class MetaTag
	{
		/**
		 * All arguments on the tag
		 */
		public const args:Array = [];
		/**
		 * The tag name
		 */
		public var name:String;

		/**
		 * Constructor
		 *
		 * @param name The tag name
		 */
		public function MetaTag(name:String, xml:XMLList)
		{
			this.name = name;

			for each(var argXml:XML in xml)
			{
				args.push(new MetaTagArg(argXml.@key, argXml.@value));
			}
		}

		/**
		 * Retrieve an arg by name
		 *
		 * @param name The name to search for
		 */
		public function argByKey(key:String):MetaTagArg
		{
			for each(var arg:MetaTagArg in args)
			{
				if (arg.key == key)
					return arg;
			}

			return null;
		}

		/**
		 * Returns a string representation of the meta tag
		 */
		public function toString():String
		{
			return "MetaTag{ name:" + name + ",args:" + args + " }";
		}
	}
}