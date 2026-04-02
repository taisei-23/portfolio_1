import { application } from "./application"

import HelloController from "./hello_controller"
import MountainSidebarController from "./mountain_sidebar_controller"
import AutocompleteController from "./auto_complete"

application.register("hello", HelloController)
application.register("mountain-sidebar", MountainSidebarController)
application.register("autocomplete", AutocompleteController)

window.application = application
