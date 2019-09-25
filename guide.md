#  Windows

## Desactivar Fast Boot 
No simbolo da bateria:

**Power Options** → **Choose what closing the lid does** → **Change settings that are currently unavailable** → **Disable fast boot** 


## Libertar espaço para o linux
Pesquisar *format*:

**Create and format a partition** → **Botão lado direito**  → **Shrink volume**

Escolher o tamanho.


## Boot para a BIOS
### V1
*Shift + Shutdown* → **Advanced options** → **Uefi firmware settings** → **Restart**

### V2
**Settings** → **Update and Security** → **Recovery** → **Restart now** → **Troubleshoot** → **Advance Options** → **Uefi firmware settings** → **Restart**

###  Security
Disable secure boot.

### Boot order
Mudar a boot order para USB em primeiro lugar.

### Save changes and exit

# Linux
Instalação normal.


# GPU related problems
- No `grub`, na opção de boot do distro de linux: `e`
- Entre o `quiet` e `splash` adicionar uma das seguintes flags
- `ctrl x`

## Flags
- `acpi_osi=! acpi_osi="Windows 2009"`
- `nomodeset`
- `noveau.modeset=0`
- `acpi=0`


## Permanente
Quando uma combinação de flags resultar:

- `sudo vi /etc/default/grub`
- Adicionar a(s) flag(s) no `GRUB_CMDLINE_LINUX_DEFAULT`
- `sudo update-grub`
