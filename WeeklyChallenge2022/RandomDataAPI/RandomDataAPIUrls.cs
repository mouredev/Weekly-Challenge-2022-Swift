using System;
namespace WeeklyChallenge2022.RandomDataAPI
{
    internal class RandomDataAPIUrls
    {
        private const string BaseUrl = @"https://random-data-api.com/api/";

        internal static Uri LoremIpsum => new (BaseUrl + @"lorem_ipsum/random_lorem_ipsum");
    }
}
