using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace WeeklyChallenge2022.RandomDataAPI.Entities
{
    public class LoremIpsumDto
    {
        [JsonPropertyName("id")]
        public int Id { get; set; }

        [JsonPropertyName("uid")]
        public Guid Uid { get; set; }

        [JsonPropertyName("word")]
        public string Word { get; set; }

        [JsonPropertyName("words")]
        public List<string> Words { get; set; }

        [JsonPropertyName("characters")]
        public string Characters { get; set; }

        [JsonPropertyName("short_sentence")]
        public string ShortSentence { get; set; }

        [JsonPropertyName("long_sentence")]
        public string LongSentence { get; set; }

        [JsonPropertyName("very_long_sentence")]
        public string VeryLongSentence { get; set; }

        [JsonPropertyName("paragraphs")]
        public List<string> Paragraphs { get; set; }

        [JsonPropertyName("question")]
        public string Question { get; set; }

        [JsonPropertyName("questions")]
        public List<string> Questions { get; set; }
    }
}
