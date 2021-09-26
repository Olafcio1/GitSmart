#!/usr/bin/env bash
clear
echo "Git Smart 1.8 [Olafcio Corporation ©`date +"%Y"`]"
if [[ -f ".sm" ]]
then
	rm .sm
	echo "WARNING: Root user permissions is enabled, to disable it run this program with user another than root"
fi
echo "Exit typing 'exit' and clicking Enter"
trap "" SIGINT

while [ 1 ]
do
	echo -n "-> "
	read cmd
	case $cmd in
		"" | " ") ;;
		"dir")
			echo "Files in repository:"
			ls .
			ls *
			ls */*
			ls */*/*
			ls */*/*/*
			ls */*/*/*/*
			ls */*/*/*/*/*
			ls */*/*/*/*/*/*
		;;
		"b" | "branch")
			echo "Your current branch:"
			git branch
		;;
		"sb" | "switchbranch")
			echo -n "Name (without spaces) -> "
			read answer
			case $answer in
				"" | " ") echo "This name is not valid; select another one." ;;
				*)
					echo "Switching (if does not exists, creating new)..."
					git checkout -b $answer
			esac
		;;
		"cb" | "createbranch")
			echo -n "Name (without spaces) -> "
			read answer
			case $answer in
				"" | " " | "master" | "main") echo "This name is not valid; select another one." ;;
				*)
					echo "Creating new branch named '$answer'..."
					git push --set-upstream origin $answer
			esac
		;;
		"c" | "commit")
			echo -n "Commit description -> "
			read answer
			git commit -m "$answer"
		;;
		"a" | "add")
			echo -n "File/directory to add -> "
			read answer
			git add $answer
		;;
		"ae" | "addeverything")
			echo "Adding..."
			for i in `ls`
			do
				if [[ $i != "." && $i != ".." && $i != "" && $i != " " && $i != "git.sh" ]]
				then
					git add $i
				fi
			done
			echo "Added"
		;;
		"l" | "log") git log ;;
		"p" | "push") git push ;;
		"u" | "pull") git pull ;;
		"s" | "save")
			echo -n "Commit description -> "
			read answer
			echo "Saving..."
			git commit -m "$answer"
			for i in `ls`
			do
				if [[ $i != "." && $i != ".." && $i != "" && $i != " " && $i != "git.sh" ]]
				then
					git add $i
				fi
			done
			git push
		;;
		"e" | "exit") echo "Exited"; exit 0 ;;
		"sm" | "sudomode") touch .sm; sudo ./git.sh ;;
		"h" | "help")
			echo -n "What command you don't understand? (type nothing for main help)? -> "
			read answer
			case $answer in
				"" | " " | "main" | "nothing")
					echo "Commands:"
					echo " b/branch: Show your current branch"
					echo " sb/switchbranch: Switch to specified branch/create new branch of specified name (first do this command and after do createbranch to create branch)"
					echo " cb/createbranch: Create branch of specififed name"
					echo " c/commit: Commit your code"
					echo " p/push: Push your code"
					echo " u/pull: Download code from remote repository"
					echo " s/save: Commit and push"
					echo " e/exit: Exit from Git Smart"
					echo " a/add: Add specified file/directory"
					echo " ae/addeverything: Add every file from your repository to commit it"
					echo " l/log: Show what you changed"
					echo " sm/sudomode: Enable root user permissions (not recommended)"
				;;
				"b" | "branch") HELPB="Show your current branch"; echo $HELPB ;;
				"sb" | "switchbranch") HELPSB="Switch to specified branch/create new branch of specified name"; echo $HELPSB ;;
				"c" | "commit") HELPC="Commit your code"; echo $HELPC ;;
				"p" | "push") HELPP="Push your code"; echo $HELPP ;;
				"u" | "pull") HELPU="Download code from remote repository"; echo $HELPU ;;
				"s" | "save") HELPS="Commit and push"; echo $HELPS ;;
				"e" | "exit") HELPE="Exit from Git Smart"; echo $HELPE ;;
				"a" | "add") HELPA="Add specified file/directory"; echo $HELPA ;;
				"ae" | "addeverything") HELPAE="Add every file from your repository to commit it"; echo $HELPAE ;;
				"l" | "log") HELPL="Show what you changed"; echo $HELPL ;;
				"h" | "help") HELPH="Show help"; echo $HELPH ;;
				"sm" | "sudomode") HELPSM="Enable root user permissions (not recommended)"; echo $HELPSM ;;
				"cb" | "createbranch") HELPCB="Create branch of specified name"; echo $HELPCB ;;
				*) echo "You entered unkown command; type help for all commands."
			esac
		;;
		"h b" | "h branch" | "help b" | "help branch") echo "Show your current branch" ;;
		"h sb" | "h switchbranch" | "help sb" | "help switchbranch") echo "Switch to specified branch/create new branch of specified name" ;;
		"h c" | "h commit" | "help c" | "help commit") echo "Commit your code" ;;
		"h p" | "h push" | "help p" | "help push") echo "Push your code" ;;
		"h u" | "h pull" | "help u" | "help pull") echo "Download code from remote repository" ;;
		"h s" | "h save" | "help s" | "help save") echo "Commit and push" ;;
		"h e" | "h exit" | "help e" | "help exit") echo "Exit from Git Smart" ;;
		"h a" | "h add" | "help a" | "help add") echo "Add specified file/directory" ;;
		"h ae" | "h addeverything" | "help ae" | "help addeverything") echo "Add every file from your repository to commit it" ;;
		"h l" | "h log" | "help l" | "help log") echo "Show what you changed" ;;
		"h h" | "h help" | "help h" | "help help") echo "Show help" ;;
		"h sm" | "h sudomode" | "help sm" | "help sudomode") echo "Enable root user permissions (not recommended)" ;;
		"h cb" | "h createbranch" | "help cb" | "help createbranch") echo "Create branch of specified name" ;;
		*) echo "You entered unkown command; type help for help."
	esac
done
