clearinfo

#script needs to be in the same folder as the desired sound and t_grid files
#change the name of the below sound and t_grid as to correspond with your files
#names of the files need to be in the same format
#the default number of random intervals copied is set to 100
#default layer of interval is set to 1

sound = Read from file: "mazur_milanek"
t_grid = Read from file: "mazur_milanek.TextGrid"
target = 100
number_of_intervals = Get number of intervals: 1

######### CODE #########

printline The target number of random selected intervals is currently set to 'target'
printline Top interval is the last randomly selected interval


result = Create Sound from formula: "nahodny_segment", 1, 0, 1, 44100, "1 * sin(2*pi*0*x)"
selectObject: t_grid

for int from 1 to target

	random_number = randomInteger (1, number_of_intervals)
	select t_grid
	t1 = Get start time of interval: 1, random_number
	t2 = Get end time of interval: 1 , random_number

	label$ = Get label of interval: 1, random_number

	printline 'label$'
	selectObject: sound
	Edit
	editor: sound
	Select: t1, t2
	Copy selection to Sound clipboard
	Close
	endeditor
	selectObject: result
	Edit
	editor: result
	Move cursor to: 0
	Paste after selection
	Close
	endeditor

endfor

select sound
plus t_grid
Remove