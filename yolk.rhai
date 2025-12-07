export let data = #{
  git: #{
    name: "NexushasTaken",
    email: "nexushastaken@gmail.com",
  },
};

export let eggs = #{
  bootstrap: #{
    enabled: true,
    targets: "~/.config/bootstrap",
    unsafe_shell_hooks: #{
      post_deploy: "./bin/archlinux.sh",
    },
  },

  git: #{
    enabled: true,
    targets: "~/.config/git",
    templates: [
      "config",
    ],
  },
  bat: #{
    enabled: true,
    targets: "~/.config/bat",
  },

  bash: #{
    enabled: true,
    targets: #{
      "bashrc.sh": "~/.bashrc",
      "bash_profile.sh": "~/.bash_profile",
      ".": "~/.config/bash",
    },
  },

  lazygit: #{
    enabled: true,
    targets: "~/.config/lazygit",
  },
  superfile: #{
    enabled: true,
    targets: "~/.config/superfile",
  },
};
