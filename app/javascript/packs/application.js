import "bootstrap";

import { exempleShow } from '../functions/exempleShow'
import { dynamicForm } from '../functions/moreHanjas'
import { toggleListePannel } from '../functions/toggleAddListes'
import { searchList } from '../functions/searchList'
import { addFurigana } from '../functions/addFurigana'
import { autocompleteDropDown } from '../functions/autocompleteDropDown'
import { autocompleteSearch } from '../functions/autocomplete'
import { forvo } from '../functions/forvo'
//import { suggestionDropDown } from '../functions/suggestionDropDown'

exempleShow();
dynamicForm();
toggleListePannel();
searchList();
addFurigana();
autocompleteDropDown();
autocompleteSearch();
forvo();
