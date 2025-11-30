export let eggs = #{
  git: #{
    enabled: true,
    targets: "~",
    strategy: "merge",
    templates: [".gitconfig"],
    main_file: ".gitconfig",
  },

  hyprland: #{
    enabled: SYSTEM.distro == "Arch Linux",
    targets: "~/.config/hypr",
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
    unsafe_shell_hooks: #{
      pre_deploy: "./bin/bat.sh",
    },
  },

  bash: #{
    enabled: SYSTEM.distro == "Arch Linux",
    targets: "~/.config/bash",
    unsafe_shell_hooks: #{
      post_deploy: "./bin/bash/post_deploy.sh",
      pre_undeploy: "./bin/bash/pre_undeploy.sh",
    },
  },

  alacritty: #{
    enabled: SYSTEM.distro == "Arch Linux",
    targets: "~/.config/alacritty",
    unsafe_shell_hooks: #{
      pre_deploy: "./bin/alacritty.sh",
    },
  }
};

let git = #{
  email: "nexushastaken@gmail.com",
  name: "NexushasTaken",
};
