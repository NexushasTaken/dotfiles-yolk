export let eggs = #{
  git: #{
    targets: "~",
    strategy: "merge",
    templates: [ ".gitconfig" ],
    main_file: ".gitconfig",
  },

  hyprland: #{
    enabled: SYSTEM.distro == "Arch Linux",
    targets: "~/.config/hypr",
    templates: ["hyprland.conf"],
    unsafe_shell_hooks: #{
      pre_deploy: "./bin/hyprland.sh",
    },
  },

  ly: #{
    enabled: SYSTEM.distro == "Arch Linux",
    targets: "~/.config/ly",
    unsafe_shell_hooks: #{
      pre_deploy: "./bin/ly.sh",
    },
  },

  bat: #{
    enabled: SYSTEM.distro == "Arch Linux",
    targets: "~/.config/bat",
    templates: ["config"],
    unsafe_shell_hooks: #{
      pre_deploy: "./bin/bat.sh",
    },
  }
};

let git = #{
  email: "nexushastaken@gmail.com",
  name: "NexushasTaken",
};
