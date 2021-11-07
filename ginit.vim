if exists(':GuiTabline')
    GuiTabline 0
endif

" In favor of cmp
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    Guifont! monospace:h10.5
endif

if exists(':GuiRenderLigatures')
    GuiRenderLigatures 1 
endif

if exists(':GuiAdaptiveColor')
    GuiAdaptiveColor 1
endif
