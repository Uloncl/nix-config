{ ... }: {
  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hybrid-sleep.enable = false;
  };
}