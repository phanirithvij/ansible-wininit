# Some ways ansible could be better

- Must have
	- Whatever mitogen does to speed things up by 2-7x
	- Better parallel workflow
		- eg. 
	      +--------------------------------------------+
	      |   do_something          do_something_2wice |
	      |        |                      |            |
	      |     do_next             kill_process       |
	      |        \                      |            |
	      |         \               kill_kittens? (no) |
	      |          \                   /             |
	      |           \                 /              |
	      |             Egg Laying Fest                |
	      |                   |                        |
	      |               endoflies                    |
	      +--------------------------------------------+

- Impossible
	- no python requirement only bash
	- rewritten in rust

- Maybe hard work
	- Realtime log output like docker or docker build kit
	- Interactive applications and execution pauses
		- eg. lazygit, lf, ranger, vim whatever. act like bash (a shell)

- Good to have
	- playbook visualizations
		- community tools exist for inventory, playbook viz
	- record and remember executions
		- ara exists
	- web ui
		- awx/tower
