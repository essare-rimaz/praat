clearinfo

#tady si doplňte jméno vašeho milánka a jeho textgridu
#je potřeba aby skript byl ve stejné složce jako tyto dokumenty
zvuk = Read from file: "mazur_milanek"
t_grid = Read from file: "mazur_milanek.TextGrid"

vysledek = Create Sound from formula: "nahodny_segment", 1, 0, 1, 44100, "1 * sin(2*pi*0*x)"

selectObject: t_grid

pocet_intervalu = Get number of intervals: 1

#tady si můžete určit horní hranici podle toho kolik chcete mít náhodných segmentů
hranice = 100

for int from 1 to hranice

	nahodne_cislo = randomInteger (1, pocet_intervalu)
	select t_grid
	t1 = Get start time of interval: 1, nahodne_cislo
	t2 = Get end time of interval: 1 , nahodne_cislo

	label$ = Get label of interval: 1, nahodne_cislo

	printline 'label$'
	selectObject: zvuk
	Edit
	editor: zvuk
	Select: t1, t2
	Copy selection to Sound clipboard
	Close
	endeditor
	selectObject: vysledek
	Edit
	editor: vysledek
	Move cursor to: 0
	Paste after selection
	Close
	endeditor

endfor

printline první segment v nahrávce je tady dole - čti směrem nahoru :-)
printline je nastaven výběr 'hranice' náhodných segmentů z nahrávky

select zvuk
plus t_grid
Remove
