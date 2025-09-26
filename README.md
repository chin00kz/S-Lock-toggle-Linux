````markdown

# Scroll Lock LED Toggle

A safe way to toggle the Scroll Lock LED on Linux systems (works on Wayland and X11).

## Why?

Some keyboards (mostly budget ones) or laptops do not allow toggling the Scroll Lock LED with the keyboard alone.  
This setup safely toggles the LED without giving general root access or weakening system security.

## Steps to set up

1. **Create the toggle script**  
   Save the `toggle-scroll-lock.sh` script to `/usr/local/bin/toggle-scroll-lock`:

   ```bash
   sudo cp toggle-scroll-lock.sh /usr/local/bin/toggle-scroll-lock
   sudo chown root:root /usr/local/bin/toggle-scroll-lock
   sudo chmod 755 /usr/local/bin/toggle-scroll-lock
````

2. **Allow passwordless execution via sudo**
   Create a sudoers file:

   ```bash
   sudo tee /etc/sudoers.d/toggle-scroll-lock >/dev/null <<'EOF'
   yourusername ALL=(root) NOPASSWD: /usr/local/bin/toggle-scroll-lock
   EOF
   sudo chmod 440 /etc/sudoers.d/toggle-scroll-lock
   ```

3. **Test the script**

   ```bash
   sudo /usr/local/bin/toggle-scroll-lock
   ```

   The Scroll Lock LED should toggle.

4. **Bind the script to Scroll Lock key (Wayland/GNOME)**

   * Open **Settings → Keyboard → Custom Shortcuts → Add**
   * Name: `Toggle Scroll Lock LED`
   * Command: `sudo /usr/local/bin/toggle-scroll-lock`
   * Shortcut: press the Scroll Lock key
   * Apply and test

## Notes

* Only the exact script is allowed passwordless sudo, keeping the system safe.
* The script is root-owned and not writable by normal users.
* Works under Wayland (GNOME/KDE) or X11 (if you prefer xbindkeys).

````
