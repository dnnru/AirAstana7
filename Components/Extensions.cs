#region

using System;
using System.Collections.Generic;
using System.Linq;
using DotNetNuke.Web.DDRMenu;

#endregion

namespace AirAstana.Themes.AirAstana7.Components
{
    public static class Extensions
    {
        public static IEnumerable<IEnumerable<T>> Split<T>(this IEnumerable<T> list, int parts)
        {
            int i = 0;
            return list.GroupBy(item => i++ % parts).Select(part => part.AsEnumerable());
        }

        public static IEnumerable<IEnumerable<T>> SplitList<T>(this ICollection<T> items, int numberOfChunks)
        {
            if (numberOfChunks <= 0 || numberOfChunks > items.Count)
            {
                throw new ArgumentOutOfRangeException(nameof(numberOfChunks));
            }

            int sizePerPacket = items.Count / numberOfChunks;
            int extra = items.Count % numberOfChunks;

            for (int i = 0; i < numberOfChunks - extra; i++)
            {
                yield return items.Skip(i * sizePerPacket).Take(sizePerPacket);
            }

            int alreadyReturnedCount = (numberOfChunks - extra) * sizePerPacket;
            int toReturnCount = extra == 0 ? 0 : (items.Count - numberOfChunks) / extra + 1;
            for (int i = 0; i < extra; i++)
            {
                yield return items.Skip(alreadyReturnedCount + i * toReturnCount).Take(toReturnCount);
            }
        }

        public static string GetNodeLink(this MenuNode node)
        {
            return node.Enabled ? node.Url : "javascript:void(0)";
        }
    }
}