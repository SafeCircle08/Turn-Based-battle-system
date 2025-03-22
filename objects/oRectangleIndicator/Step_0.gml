weight = clamp(weight, 0, 100);

if (weight == 100)
{
	weight = 0;
	createExclamationMarks();
}