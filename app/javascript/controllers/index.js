import { application } from "./application"

import HelloController from "./hello_controller"
import MountainSidebarController from "./mountain_sidebar_controller"
import AutocompleteController from "./auto_complete"
import SlideInController from "./slide_in_controller"

application.register("hello", HelloController)
application.register("mountain-sidebar", MountainSidebarController)
application.register("autocomplete", AutocompleteController)
application.register("slide-in", SlideInController)

window.application = application
