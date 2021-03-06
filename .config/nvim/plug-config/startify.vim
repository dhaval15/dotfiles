let g:startify_custom_header = [
			\'    __  __        __    __                         __             ______                     __                 ',           
			\'   /  |/  |      /  |  /  |                       /  |           /      \                   /  |                ',
			\'  _$$ |$$ |_     $$ |  $$ |   ______     _______  $$ |____      /$$$$$$  |   ______     ____$$ |   ______       ',
			\' / $$  $$   |    $$ |__$$ |  /      \   /       | $$      \     $$ |  $$/   /      \   /    $$ |  /      \      ',
			\' $$$$$$$$$$/     $$    $$ |  $$$$$$  | /$$$$$$$/  $$$$$$$  |    $$ |       /$$$$$$  | /$$$$$$$ | /$$$$$$  |     ',
			\' / $$  $$   |    $$$$$$$$ |  /    $$ | $$      \  $$ |  $$ |    $$ |   __  $$ |  $$ | $$ |  $$ | $$    $$ |     ',
			\' $$$$$$$$$$/     $$ |  $$ | /$$$$$$$ |  $$$$$$  | $$ |  $$ |    $$ \__/  | $$ \__$$ | $$ \__$$ | $$$$$$$$/      ',
			\'   $$ |$$ |      $$ |  $$ | $$    $$ | /     $$/  $$ |  $$ |    $$    $$/  $$    $$/  $$    $$ | $$       |     ',
			\'   $$/ $$/       $$/   $$/   $$$$$$$/  $$$$$$$/   $$/   $$/      $$$$$$/    $$$$$$/    $$$$$$$/   $$$$$$$/      ',
			\'  														  ',
			\]

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]
