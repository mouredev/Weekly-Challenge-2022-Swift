using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using WeeklyChallenge2022.RandomDataAPI.Entities;

namespace WeeklyChallenge2022.RandomDataAPI.Services
{
    public static class LoremIpsumService
    {
        private static readonly Uri _serviceUri = RandomDataAPIUrls.LoremIpsum;
        private static Random _random = new();

        public static async Task<string> GetRandomText()
        {
            var qtyOfSentences = _random.Next(1, 11);
            var originalText = string.Empty;

            for (int i = 0; i < qtyOfSentences; i++)
            {
                originalText += (await GetLoremIpsumDto()).VeryLongSentence
                                    .ApplyModificationsToString();
            }

            return originalText;
        }
            

        private static async Task<LoremIpsumDto> GetLoremIpsumDto()
        {
            HttpClient httpClient = new();
            HttpResponseMessage response = await httpClient.GetAsync(_serviceUri);
            if (response.IsSuccessStatusCode)
            {
                var jsonResponse = await response.Content.ReadAsStringAsync();
                return JsonSerializer.Deserialize<LoremIpsumDto>(jsonResponse);
            }

            throw new HttpRequestException(response.ToString());
        }
        

        private static string ApplyModificationsToString(this string originalText)
        {
            return originalText
                .ApplyRandomCaseModifications();
        }
        private static string ApplyRandomCaseModifications(this string originalText)
        {
            var qtyChangestoApply = _random.Next(0, originalText.Length);

            if(qtyChangestoApply == 0)
            {
                return originalText;
            }    

            var positionsToModify = new List<int>();
            while(true)
            {
                var newPosition = _random.Next(0, originalText.Length);

                if (positionsToModify.Contains(newPosition) == false)
                {
                    positionsToModify.Add(newPosition);

                    if (positionsToModify.Count == qtyChangestoApply)
                    {
                        break;
                    }
                }

                
            }


            var modifiedText = new StringBuilder(originalText);
            foreach (var position in positionsToModify)
            {
                var randomBoolean = (_random.NextDouble() > 0.5);

                if(char.IsLetter(modifiedText[position]))
                {
                    if(randomBoolean)
                    {
                        modifiedText[position] = char.ToLower(modifiedText[position]);
                    }
                    else
                    {
                        modifiedText[position] = char.ToUpper(modifiedText[position]);
                    }
                }

                if(char.IsWhiteSpace(modifiedText[position]))
                {
                    if(randomBoolean)
                    {
                        modifiedText[position] = '.';
                    }
                }
            }

            return modifiedText.ToString();
        }

    }
}
