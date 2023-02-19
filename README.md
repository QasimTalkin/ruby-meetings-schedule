# ruby-meetings-schedule

The scheduling tool's calendar system allows users to arrange a set of meetings within an 8-hour day. The feature takes into account two types of meetings: on-site meetings and off-site meetings.

For on-site meetings, the feature enables users to schedule them back-to-back with no gaps in between.

For off-site meetings, the feature automatically pads 30 minutes of travel time to either end of the meeting. If there are back-to-back off-site meetings, the travel time can overlap, but it can also extend past the start and end of the day.

If the set of meetings cannot fit into the 8-hour day, the feature will notify the user.

## Examples 
Example 1:
```json
{
{ name: “Meeting 1”, duration: 1.5, type: :onsite },

{ name: “Meeting 2”, duration: 2, type: :offsite },
{ name: “Meeting 3”, duration: 1, type: :onsite },
{ name: “Meeting 4”, duration: 1, type: :offsite },
{ name: “Meeting 5”, duration: 1, type: :offsite },
}
```
```bash
Yes, can fit. One possible solution would be:
9:00 - 10:30 - Meeting 1
10:30 - 11:30 - Meeting 3
12:00 - 1:00 - Meeting 5
1:30 - 2:30 - Meeting 4
3:00 - 5:00 - Meeting 2
```
Example 2:
```json
{
{ name: “Meeting 1”, duration: 4, type: :offsite },
{ name: “Meeting 2”, duration: 4, type: :offsite }
}
```
```bash
No, can’t fit.
```
Example 3:
```json
{
{ name: “Meeting 1”, duration: 0.5, type: :offsite },
{ name: “Meeting 2”, duration: 0.5, type: :onsite },
{ name: “Meeting 3”, duration: 2.5, type: :offsite },
{ name: “Meeting 4”, duration: 3, type: :onsite }
}
```
```bash
Yes, can fit. One possible solution would be:
9:00 - 9:30 - Meeting 2
10:00 - 10:30 - Meeting 1
11:00 - 2:00 - Meeting 4
2:30 - 5:00 - Meeting 3
```
## Run Script

To run the script, run the following command in the terminal:

```bash
ruby meetings.rb
```
