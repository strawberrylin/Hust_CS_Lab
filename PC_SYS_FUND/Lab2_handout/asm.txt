
bomb：     文件格式 elf32-i386


Disassembly of section .init:

08048724 <_init>:
 8048724:	53                   	push   %ebx
 8048725:	83 ec 08             	sub    $0x8,%esp
 8048728:	e8 23 02 00 00       	call   8048950 <__x86.get_pc_thunk.bx>
 804872d:	81 c3 d3 38 00 00    	add    $0x38d3,%ebx
 8048733:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 8048739:	85 c0                	test   %eax,%eax
 804873b:	74 05                	je     8048742 <_init+0x1e>
 804873d:	e8 de 00 00 00       	call   8048820 <__gmon_start__@plt>
 8048742:	83 c4 08             	add    $0x8,%esp
 8048745:	5b                   	pop    %ebx
 8048746:	c3                   	ret    

Disassembly of section .plt:

08048750 <read@plt-0x10>:
 8048750:	ff 35 04 c0 04 08    	pushl  0x804c004
 8048756:	ff 25 08 c0 04 08    	jmp    *0x804c008
 804875c:	00 00                	add    %al,(%eax)
	...

08048760 <read@plt>:
 8048760:	ff 25 0c c0 04 08    	jmp    *0x804c00c
 8048766:	68 00 00 00 00       	push   $0x0
 804876b:	e9 e0 ff ff ff       	jmp    8048750 <_init+0x2c>

08048770 <fflush@plt>:
 8048770:	ff 25 10 c0 04 08    	jmp    *0x804c010
 8048776:	68 08 00 00 00       	push   $0x8
 804877b:	e9 d0 ff ff ff       	jmp    8048750 <_init+0x2c>

08048780 <fgets@plt>:
 8048780:	ff 25 14 c0 04 08    	jmp    *0x804c014
 8048786:	68 10 00 00 00       	push   $0x10
 804878b:	e9 c0 ff ff ff       	jmp    8048750 <_init+0x2c>

08048790 <signal@plt>:
 8048790:	ff 25 18 c0 04 08    	jmp    *0x804c018
 8048796:	68 18 00 00 00       	push   $0x18
 804879b:	e9 b0 ff ff ff       	jmp    8048750 <_init+0x2c>

080487a0 <sleep@plt>:
 80487a0:	ff 25 1c c0 04 08    	jmp    *0x804c01c
 80487a6:	68 20 00 00 00       	push   $0x20
 80487ab:	e9 a0 ff ff ff       	jmp    8048750 <_init+0x2c>

080487b0 <alarm@plt>:
 80487b0:	ff 25 20 c0 04 08    	jmp    *0x804c020
 80487b6:	68 28 00 00 00       	push   $0x28
 80487bb:	e9 90 ff ff ff       	jmp    8048750 <_init+0x2c>

080487c0 <__stack_chk_fail@plt>:
 80487c0:	ff 25 24 c0 04 08    	jmp    *0x804c024
 80487c6:	68 30 00 00 00       	push   $0x30
 80487cb:	e9 80 ff ff ff       	jmp    8048750 <_init+0x2c>

080487d0 <strcpy@plt>:
 80487d0:	ff 25 28 c0 04 08    	jmp    *0x804c028
 80487d6:	68 38 00 00 00       	push   $0x38
 80487db:	e9 70 ff ff ff       	jmp    8048750 <_init+0x2c>

080487e0 <getenv@plt>:
 80487e0:	ff 25 2c c0 04 08    	jmp    *0x804c02c
 80487e6:	68 40 00 00 00       	push   $0x40
 80487eb:	e9 60 ff ff ff       	jmp    8048750 <_init+0x2c>

080487f0 <puts@plt>:
 80487f0:	ff 25 30 c0 04 08    	jmp    *0x804c030
 80487f6:	68 48 00 00 00       	push   $0x48
 80487fb:	e9 50 ff ff ff       	jmp    8048750 <_init+0x2c>

08048800 <__memmove_chk@plt>:
 8048800:	ff 25 34 c0 04 08    	jmp    *0x804c034
 8048806:	68 50 00 00 00       	push   $0x50
 804880b:	e9 40 ff ff ff       	jmp    8048750 <_init+0x2c>

08048810 <__memcpy_chk@plt>:
 8048810:	ff 25 38 c0 04 08    	jmp    *0x804c038
 8048816:	68 58 00 00 00       	push   $0x58
 804881b:	e9 30 ff ff ff       	jmp    8048750 <_init+0x2c>

08048820 <__gmon_start__@plt>:
 8048820:	ff 25 3c c0 04 08    	jmp    *0x804c03c
 8048826:	68 60 00 00 00       	push   $0x60
 804882b:	e9 20 ff ff ff       	jmp    8048750 <_init+0x2c>

08048830 <exit@plt>:
 8048830:	ff 25 40 c0 04 08    	jmp    *0x804c040
 8048836:	68 68 00 00 00       	push   $0x68
 804883b:	e9 10 ff ff ff       	jmp    8048750 <_init+0x2c>

08048840 <__libc_start_main@plt>:
 8048840:	ff 25 44 c0 04 08    	jmp    *0x804c044
 8048846:	68 70 00 00 00       	push   $0x70
 804884b:	e9 00 ff ff ff       	jmp    8048750 <_init+0x2c>

08048850 <write@plt>:
 8048850:	ff 25 48 c0 04 08    	jmp    *0x804c048
 8048856:	68 78 00 00 00       	push   $0x78
 804885b:	e9 f0 fe ff ff       	jmp    8048750 <_init+0x2c>

08048860 <__isoc99_sscanf@plt>:
 8048860:	ff 25 4c c0 04 08    	jmp    *0x804c04c
 8048866:	68 80 00 00 00       	push   $0x80
 804886b:	e9 e0 fe ff ff       	jmp    8048750 <_init+0x2c>

08048870 <fopen@plt>:
 8048870:	ff 25 50 c0 04 08    	jmp    *0x804c050
 8048876:	68 88 00 00 00       	push   $0x88
 804887b:	e9 d0 fe ff ff       	jmp    8048750 <_init+0x2c>

08048880 <__errno_location@plt>:
 8048880:	ff 25 54 c0 04 08    	jmp    *0x804c054
 8048886:	68 90 00 00 00       	push   $0x90
 804888b:	e9 c0 fe ff ff       	jmp    8048750 <_init+0x2c>

08048890 <__printf_chk@plt>:
 8048890:	ff 25 58 c0 04 08    	jmp    *0x804c058
 8048896:	68 98 00 00 00       	push   $0x98
 804889b:	e9 b0 fe ff ff       	jmp    8048750 <_init+0x2c>

080488a0 <socket@plt>:
 80488a0:	ff 25 5c c0 04 08    	jmp    *0x804c05c
 80488a6:	68 a0 00 00 00       	push   $0xa0
 80488ab:	e9 a0 fe ff ff       	jmp    8048750 <_init+0x2c>

080488b0 <__fprintf_chk@plt>:
 80488b0:	ff 25 60 c0 04 08    	jmp    *0x804c060
 80488b6:	68 a8 00 00 00       	push   $0xa8
 80488bb:	e9 90 fe ff ff       	jmp    8048750 <_init+0x2c>

080488c0 <gethostbyname@plt>:
 80488c0:	ff 25 64 c0 04 08    	jmp    *0x804c064
 80488c6:	68 b0 00 00 00       	push   $0xb0
 80488cb:	e9 80 fe ff ff       	jmp    8048750 <_init+0x2c>

080488d0 <strtol@plt>:
 80488d0:	ff 25 68 c0 04 08    	jmp    *0x804c068
 80488d6:	68 b8 00 00 00       	push   $0xb8
 80488db:	e9 70 fe ff ff       	jmp    8048750 <_init+0x2c>

080488e0 <connect@plt>:
 80488e0:	ff 25 6c c0 04 08    	jmp    *0x804c06c
 80488e6:	68 c0 00 00 00       	push   $0xc0
 80488eb:	e9 60 fe ff ff       	jmp    8048750 <_init+0x2c>

080488f0 <close@plt>:
 80488f0:	ff 25 70 c0 04 08    	jmp    *0x804c070
 80488f6:	68 c8 00 00 00       	push   $0xc8
 80488fb:	e9 50 fe ff ff       	jmp    8048750 <_init+0x2c>

08048900 <__ctype_b_loc@plt>:
 8048900:	ff 25 74 c0 04 08    	jmp    *0x804c074
 8048906:	68 d0 00 00 00       	push   $0xd0
 804890b:	e9 40 fe ff ff       	jmp    8048750 <_init+0x2c>

08048910 <__sprintf_chk@plt>:
 8048910:	ff 25 78 c0 04 08    	jmp    *0x804c078
 8048916:	68 d8 00 00 00       	push   $0xd8
 804891b:	e9 30 fe ff ff       	jmp    8048750 <_init+0x2c>

Disassembly of section .text:

08048920 <_start>:
 8048920:	31 ed                	xor    %ebp,%ebp
 8048922:	5e                   	pop    %esi
 8048923:	89 e1                	mov    %esp,%ecx
 8048925:	83 e4 f0             	and    $0xfffffff0,%esp
 8048928:	50                   	push   %eax
 8048929:	54                   	push   %esp
 804892a:	52                   	push   %edx
 804892b:	68 e0 9f 04 08       	push   $0x8049fe0
 8048930:	68 70 9f 04 08       	push   $0x8049f70
 8048935:	51                   	push   %ecx
 8048936:	56                   	push   %esi
 8048937:	68 1d 8a 04 08       	push   $0x8048a1d
 804893c:	e8 ff fe ff ff       	call   8048840 <__libc_start_main@plt>
 8048941:	f4                   	hlt    
 8048942:	66 90                	xchg   %ax,%ax
 8048944:	66 90                	xchg   %ax,%ax
 8048946:	66 90                	xchg   %ax,%ax
 8048948:	66 90                	xchg   %ax,%ax
 804894a:	66 90                	xchg   %ax,%ax
 804894c:	66 90                	xchg   %ax,%ax
 804894e:	66 90                	xchg   %ax,%ax

08048950 <__x86.get_pc_thunk.bx>:
 8048950:	8b 1c 24             	mov    (%esp),%ebx
 8048953:	c3                   	ret    
 8048954:	66 90                	xchg   %ax,%ax
 8048956:	66 90                	xchg   %ax,%ax
 8048958:	66 90                	xchg   %ax,%ax
 804895a:	66 90                	xchg   %ax,%ax
 804895c:	66 90                	xchg   %ax,%ax
 804895e:	66 90                	xchg   %ax,%ax

08048960 <deregister_tm_clones>:
 8048960:	b8 a3 c3 04 08       	mov    $0x804c3a3,%eax
 8048965:	2d a0 c3 04 08       	sub    $0x804c3a0,%eax
 804896a:	83 f8 06             	cmp    $0x6,%eax
 804896d:	77 01                	ja     8048970 <deregister_tm_clones+0x10>
 804896f:	c3                   	ret    
 8048970:	b8 00 00 00 00       	mov    $0x0,%eax
 8048975:	85 c0                	test   %eax,%eax
 8048977:	74 f6                	je     804896f <deregister_tm_clones+0xf>
 8048979:	55                   	push   %ebp
 804897a:	89 e5                	mov    %esp,%ebp
 804897c:	83 ec 18             	sub    $0x18,%esp
 804897f:	c7 04 24 a0 c3 04 08 	movl   $0x804c3a0,(%esp)
 8048986:	ff d0                	call   *%eax
 8048988:	c9                   	leave  
 8048989:	c3                   	ret    
 804898a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

08048990 <register_tm_clones>:
 8048990:	b8 a0 c3 04 08       	mov    $0x804c3a0,%eax
 8048995:	2d a0 c3 04 08       	sub    $0x804c3a0,%eax
 804899a:	c1 f8 02             	sar    $0x2,%eax
 804899d:	89 c2                	mov    %eax,%edx
 804899f:	c1 ea 1f             	shr    $0x1f,%edx
 80489a2:	01 d0                	add    %edx,%eax
 80489a4:	d1 f8                	sar    %eax
 80489a6:	75 01                	jne    80489a9 <register_tm_clones+0x19>
 80489a8:	c3                   	ret    
 80489a9:	ba 00 00 00 00       	mov    $0x0,%edx
 80489ae:	85 d2                	test   %edx,%edx
 80489b0:	74 f6                	je     80489a8 <register_tm_clones+0x18>
 80489b2:	55                   	push   %ebp
 80489b3:	89 e5                	mov    %esp,%ebp
 80489b5:	83 ec 18             	sub    $0x18,%esp
 80489b8:	89 44 24 04          	mov    %eax,0x4(%esp)
 80489bc:	c7 04 24 a0 c3 04 08 	movl   $0x804c3a0,(%esp)
 80489c3:	ff d2                	call   *%edx
 80489c5:	c9                   	leave  
 80489c6:	c3                   	ret    
 80489c7:	89 f6                	mov    %esi,%esi
 80489c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080489d0 <__do_global_dtors_aux>:
 80489d0:	80 3d c4 c3 04 08 00 	cmpb   $0x0,0x804c3c4
 80489d7:	75 13                	jne    80489ec <__do_global_dtors_aux+0x1c>
 80489d9:	55                   	push   %ebp
 80489da:	89 e5                	mov    %esp,%ebp
 80489dc:	83 ec 08             	sub    $0x8,%esp
 80489df:	e8 7c ff ff ff       	call   8048960 <deregister_tm_clones>
 80489e4:	c6 05 c4 c3 04 08 01 	movb   $0x1,0x804c3c4
 80489eb:	c9                   	leave  
 80489ec:	f3 c3                	repz ret 
 80489ee:	66 90                	xchg   %ax,%ax

080489f0 <frame_dummy>:
 80489f0:	a1 10 bf 04 08       	mov    0x804bf10,%eax
 80489f5:	85 c0                	test   %eax,%eax
 80489f7:	74 1f                	je     8048a18 <frame_dummy+0x28>
 80489f9:	b8 00 00 00 00       	mov    $0x0,%eax
 80489fe:	85 c0                	test   %eax,%eax
 8048a00:	74 16                	je     8048a18 <frame_dummy+0x28>
 8048a02:	55                   	push   %ebp
 8048a03:	89 e5                	mov    %esp,%ebp
 8048a05:	83 ec 18             	sub    $0x18,%esp
 8048a08:	c7 04 24 10 bf 04 08 	movl   $0x804bf10,(%esp)
 8048a0f:	ff d0                	call   *%eax
 8048a11:	c9                   	leave  
 8048a12:	e9 79 ff ff ff       	jmp    8048990 <register_tm_clones>
 8048a17:	90                   	nop
 8048a18:	e9 73 ff ff ff       	jmp    8048990 <register_tm_clones>

08048a1d <main>:
 8048a1d:	55                   	push   %ebp
 8048a1e:	89 e5                	mov    %esp,%ebp
 8048a20:	53                   	push   %ebx
 8048a21:	83 e4 f0             	and    $0xfffffff0,%esp
 8048a24:	83 ec 10             	sub    $0x10,%esp
 8048a27:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a2a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 8048a2d:	83 f8 01             	cmp    $0x1,%eax
 8048a30:	75 0c                	jne    8048a3e <main+0x21>
 8048a32:	a1 a4 c3 04 08       	mov    0x804c3a4,%eax
 8048a37:	a3 cc c3 04 08       	mov    %eax,0x804c3cc
 8048a3c:	eb 74                	jmp    8048ab2 <main+0x95>
 8048a3e:	83 f8 02             	cmp    $0x2,%eax
 8048a41:	75 49                	jne    8048a8c <main+0x6f>
 8048a43:	c7 44 24 04 00 a0 04 	movl   $0x804a000,0x4(%esp)
 8048a4a:	08 
 8048a4b:	8b 43 04             	mov    0x4(%ebx),%eax
 8048a4e:	89 04 24             	mov    %eax,(%esp)
 8048a51:	e8 1a fe ff ff       	call   8048870 <fopen@plt>
 8048a56:	a3 cc c3 04 08       	mov    %eax,0x804c3cc
 8048a5b:	85 c0                	test   %eax,%eax
 8048a5d:	75 53                	jne    8048ab2 <main+0x95>
 8048a5f:	8b 43 04             	mov    0x4(%ebx),%eax
 8048a62:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048a66:	8b 03                	mov    (%ebx),%eax
 8048a68:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048a6c:	c7 44 24 04 02 a0 04 	movl   $0x804a002,0x4(%esp)
 8048a73:	08 
 8048a74:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048a7b:	e8 10 fe ff ff       	call   8048890 <__printf_chk@plt>
 8048a80:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048a87:	e8 a4 fd ff ff       	call   8048830 <exit@plt>
 8048a8c:	8b 03                	mov    (%ebx),%eax
 8048a8e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048a92:	c7 44 24 04 1f a0 04 	movl   $0x804a01f,0x4(%esp)
 8048a99:	08 
 8048a9a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048aa1:	e8 ea fd ff ff       	call   8048890 <__printf_chk@plt>
 8048aa6:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048aad:	e8 7e fd ff ff       	call   8048830 <exit@plt>
 8048ab2:	e8 cf 05 00 00       	call   8049086 <initialize_bomb>
 8048ab7:	c7 04 24 84 a0 04 08 	movl   $0x804a084,(%esp)
 8048abe:	e8 2d fd ff ff       	call   80487f0 <puts@plt>
 8048ac3:	c7 04 24 c0 a0 04 08 	movl   $0x804a0c0,(%esp)
 8048aca:	e8 21 fd ff ff       	call   80487f0 <puts@plt>
 8048acf:	e8 c8 06 00 00       	call   804919c <read_line>
 8048ad4:	89 04 24             	mov    %eax,(%esp)
 8048ad7:	e8 b4 00 00 00       	call   8048b90 <phase_1>
 8048adc:	e8 b5 07 00 00       	call   8049296 <phase_defused>
 8048ae1:	c7 04 24 ec a0 04 08 	movl   $0x804a0ec,(%esp)
 8048ae8:	e8 03 fd ff ff       	call   80487f0 <puts@plt>
 8048aed:	e8 aa 06 00 00       	call   804919c <read_line>
 8048af2:	89 04 24             	mov    %eax,(%esp)
 8048af5:	e8 ba 00 00 00       	call   8048bb4 <phase_2>
 8048afa:	e8 97 07 00 00       	call   8049296 <phase_defused>
 8048aff:	c7 04 24 39 a0 04 08 	movl   $0x804a039,(%esp)
 8048b06:	e8 e5 fc ff ff       	call   80487f0 <puts@plt>
 8048b0b:	e8 8c 06 00 00       	call   804919c <read_line>
 8048b10:	89 04 24             	mov    %eax,(%esp)
 8048b13:	e8 e9 00 00 00       	call   8048c01 <phase_3>
 8048b18:	e8 79 07 00 00       	call   8049296 <phase_defused>
 8048b1d:	c7 04 24 57 a0 04 08 	movl   $0x804a057,(%esp)
 8048b24:	e8 c7 fc ff ff       	call   80487f0 <puts@plt>
 8048b29:	e8 6e 06 00 00       	call   804919c <read_line>
 8048b2e:	89 04 24             	mov    %eax,(%esp)
 8048b31:	e8 c0 01 00 00       	call   8048cf6 <phase_4>
 8048b36:	e8 5b 07 00 00       	call   8049296 <phase_defused>
 8048b3b:	c7 04 24 18 a1 04 08 	movl   $0x804a118,(%esp)
 8048b42:	e8 a9 fc ff ff       	call   80487f0 <puts@plt>
 8048b47:	e8 50 06 00 00       	call   804919c <read_line>
 8048b4c:	89 04 24             	mov    %eax,(%esp)
 8048b4f:	e8 0b 02 00 00       	call   8048d5f <phase_5>
 8048b54:	e8 3d 07 00 00       	call   8049296 <phase_defused>
 8048b59:	c7 04 24 66 a0 04 08 	movl   $0x804a066,(%esp)
 8048b60:	e8 8b fc ff ff       	call   80487f0 <puts@plt>
 8048b65:	e8 32 06 00 00       	call   804919c <read_line>
 8048b6a:	89 04 24             	mov    %eax,(%esp)
 8048b6d:	e8 71 02 00 00       	call   8048de3 <phase_6>
 8048b72:	e8 1f 07 00 00       	call   8049296 <phase_defused>
 8048b77:	b8 00 00 00 00       	mov    $0x0,%eax
 8048b7c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048b7f:	c9                   	leave  
 8048b80:	c3                   	ret    
 8048b81:	66 90                	xchg   %ax,%ax
 8048b83:	66 90                	xchg   %ax,%ax
 8048b85:	66 90                	xchg   %ax,%ax
 8048b87:	66 90                	xchg   %ax,%ax
 8048b89:	66 90                	xchg   %ax,%ax
 8048b8b:	66 90                	xchg   %ax,%ax
 8048b8d:	66 90                	xchg   %ax,%ax
 8048b8f:	90                   	nop

08048b90 <phase_1>:
 8048b90:	83 ec 1c             	sub    $0x1c,%esp
 8048b93:	c7 44 24 04 3c a1 04 	movl   $0x804a13c,0x4(%esp)
 8048b9a:	08 
 8048b9b:	8b 44 24 20          	mov    0x20(%esp),%eax
 8048b9f:	89 04 24             	mov    %eax,(%esp)
 8048ba2:	e8 73 04 00 00       	call   804901a <strings_not_equal>
 8048ba7:	85 c0                	test   %eax,%eax
 8048ba9:	74 05                	je     8048bb0 <phase_1+0x20>
 8048bab:	e8 75 05 00 00       	call   8049125 <explode_bomb>
 8048bb0:	83 c4 1c             	add    $0x1c,%esp
 8048bb3:	c3                   	ret    

08048bb4 <phase_2>:
 8048bb4:	53                   	push   %ebx
 8048bb5:	83 ec 38             	sub    $0x38,%esp
 8048bb8:	8d 44 24 18          	lea    0x18(%esp),%eax
 8048bbc:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048bc0:	8b 44 24 40          	mov    0x40(%esp),%eax
 8048bc4:	89 04 24             	mov    %eax,(%esp)
 8048bc7:	e8 80 05 00 00       	call   804914c <read_six_numbers>
 8048bcc:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 8048bd1:	79 22                	jns    8048bf5 <phase_2+0x41>
 8048bd3:	e8 4d 05 00 00       	call   8049125 <explode_bomb>
 8048bd8:	eb 1b                	jmp    8048bf5 <phase_2+0x41>
 8048bda:	89 d8                	mov    %ebx,%eax
 8048bdc:	03 44 9c 14          	add    0x14(%esp,%ebx,4),%eax
 8048be0:	39 44 9c 18          	cmp    %eax,0x18(%esp,%ebx,4)
 8048be4:	74 05                	je     8048beb <phase_2+0x37>
 8048be6:	e8 3a 05 00 00       	call   8049125 <explode_bomb>
 8048beb:	83 c3 01             	add    $0x1,%ebx
 8048bee:	83 fb 06             	cmp    $0x6,%ebx
 8048bf1:	75 e7                	jne    8048bda <phase_2+0x26>
 8048bf3:	eb 07                	jmp    8048bfc <phase_2+0x48>
 8048bf5:	bb 01 00 00 00       	mov    $0x1,%ebx
 8048bfa:	eb de                	jmp    8048bda <phase_2+0x26>
 8048bfc:	83 c4 38             	add    $0x38,%esp
 8048bff:	5b                   	pop    %ebx
 8048c00:	c3                   	ret    

08048c01 <phase_3>:
 8048c01:	83 ec 2c             	sub    $0x2c,%esp
 8048c04:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 8048c08:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048c0c:	8d 44 24 18          	lea    0x18(%esp),%eax
 8048c10:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048c14:	c7 44 24 04 cf a2 04 	movl   $0x804a2cf,0x4(%esp)
 8048c1b:	08 
 8048c1c:	8b 44 24 30          	mov    0x30(%esp),%eax
 8048c20:	89 04 24             	mov    %eax,(%esp)
 8048c23:	e8 38 fc ff ff       	call   8048860 <__isoc99_sscanf@plt>
 8048c28:	83 f8 01             	cmp    $0x1,%eax
 8048c2b:	7f 05                	jg     8048c32 <phase_3+0x31>
 8048c2d:	e8 f3 04 00 00       	call   8049125 <explode_bomb>
 8048c32:	83 7c 24 18 07       	cmpl   $0x7,0x18(%esp)
 8048c37:	77 3c                	ja     8048c75 <phase_3+0x74>
 8048c39:	8b 44 24 18          	mov    0x18(%esp),%eax
 8048c3d:	ff 24 85 90 a1 04 08 	jmp    *0x804a190(,%eax,4)
 8048c44:	b8 5a 01 00 00       	mov    $0x15a,%eax
 8048c49:	eb 3b                	jmp    8048c86 <phase_3+0x85>
 8048c4b:	b8 a9 00 00 00       	mov    $0xa9,%eax
 8048c50:	eb 34                	jmp    8048c86 <phase_3+0x85>
 8048c52:	b8 20 01 00 00       	mov    $0x120,%eax
 8048c57:	eb 2d                	jmp    8048c86 <phase_3+0x85>
 8048c59:	b8 8c 02 00 00       	mov    $0x28c,%eax
 8048c5e:	eb 26                	jmp    8048c86 <phase_3+0x85>
 8048c60:	b8 71 01 00 00       	mov    $0x171,%eax
 8048c65:	eb 1f                	jmp    8048c86 <phase_3+0x85>
 8048c67:	b8 bd 02 00 00       	mov    $0x2bd,%eax
 8048c6c:	eb 18                	jmp    8048c86 <phase_3+0x85>
 8048c6e:	b8 02 03 00 00       	mov    $0x302,%eax
 8048c73:	eb 11                	jmp    8048c86 <phase_3+0x85>
 8048c75:	e8 ab 04 00 00       	call   8049125 <explode_bomb>
 8048c7a:	b8 00 00 00 00       	mov    $0x0,%eax
 8048c7f:	eb 05                	jmp    8048c86 <phase_3+0x85>
 8048c81:	b8 f8 02 00 00       	mov    $0x2f8,%eax
 8048c86:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 8048c8a:	74 05                	je     8048c91 <phase_3+0x90>
 8048c8c:	e8 94 04 00 00       	call   8049125 <explode_bomb>
 8048c91:	83 c4 2c             	add    $0x2c,%esp
 8048c94:	c3                   	ret    

08048c95 <func4>:
 8048c95:	56                   	push   %esi
 8048c96:	53                   	push   %ebx
 8048c97:	83 ec 14             	sub    $0x14,%esp
 8048c9a:	8b 54 24 20          	mov    0x20(%esp),%edx
 8048c9e:	8b 44 24 24          	mov    0x24(%esp),%eax
 8048ca2:	8b 5c 24 28          	mov    0x28(%esp),%ebx
 8048ca6:	89 d9                	mov    %ebx,%ecx
 8048ca8:	29 c1                	sub    %eax,%ecx
 8048caa:	89 ce                	mov    %ecx,%esi
 8048cac:	c1 ee 1f             	shr    $0x1f,%esi
 8048caf:	01 f1                	add    %esi,%ecx
 8048cb1:	d1 f9                	sar    %ecx
 8048cb3:	01 c1                	add    %eax,%ecx
 8048cb5:	39 d1                	cmp    %edx,%ecx
 8048cb7:	7e 17                	jle    8048cd0 <func4+0x3b>
 8048cb9:	83 e9 01             	sub    $0x1,%ecx
 8048cbc:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8048cc0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048cc4:	89 14 24             	mov    %edx,(%esp)
 8048cc7:	e8 c9 ff ff ff       	call   8048c95 <func4>
 8048ccc:	01 c0                	add    %eax,%eax
 8048cce:	eb 20                	jmp    8048cf0 <func4+0x5b>
 8048cd0:	b8 00 00 00 00       	mov    $0x0,%eax
 8048cd5:	39 d1                	cmp    %edx,%ecx
 8048cd7:	7d 17                	jge    8048cf0 <func4+0x5b>
 8048cd9:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8048cdd:	83 c1 01             	add    $0x1,%ecx
 8048ce0:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048ce4:	89 14 24             	mov    %edx,(%esp)
 8048ce7:	e8 a9 ff ff ff       	call   8048c95 <func4>
 8048cec:	8d 44 00 01          	lea    0x1(%eax,%eax,1),%eax
 8048cf0:	83 c4 14             	add    $0x14,%esp
 8048cf3:	5b                   	pop    %ebx
 8048cf4:	5e                   	pop    %esi
 8048cf5:	c3                   	ret    

08048cf6 <phase_4>:
 8048cf6:	83 ec 2c             	sub    $0x2c,%esp
 8048cf9:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 8048cfd:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8048d01:	8d 44 24 18          	lea    0x18(%esp),%eax
 8048d05:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048d09:	c7 44 24 04 cf a2 04 	movl   $0x804a2cf,0x4(%esp)
 8048d10:	08 
 8048d11:	8b 44 24 30          	mov    0x30(%esp),%eax
 8048d15:	89 04 24             	mov    %eax,(%esp)
 8048d18:	e8 43 fb ff ff       	call   8048860 <__isoc99_sscanf@plt>
 8048d1d:	83 f8 02             	cmp    $0x2,%eax
 8048d20:	75 07                	jne    8048d29 <phase_4+0x33>
 8048d22:	83 7c 24 18 0e       	cmpl   $0xe,0x18(%esp)
 8048d27:	76 05                	jbe    8048d2e <phase_4+0x38>
 8048d29:	e8 f7 03 00 00       	call   8049125 <explode_bomb>
 8048d2e:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 8048d35:	00 
 8048d36:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048d3d:	00 
 8048d3e:	8b 44 24 18          	mov    0x18(%esp),%eax
 8048d42:	89 04 24             	mov    %eax,(%esp)
 8048d45:	e8 4b ff ff ff       	call   8048c95 <func4>
 8048d4a:	83 f8 01             	cmp    $0x1,%eax
 8048d4d:	75 07                	jne    8048d56 <phase_4+0x60>
 8048d4f:	83 7c 24 1c 01       	cmpl   $0x1,0x1c(%esp)
 8048d54:	74 05                	je     8048d5b <phase_4+0x65>
 8048d56:	e8 ca 03 00 00       	call   8049125 <explode_bomb>
 8048d5b:	83 c4 2c             	add    $0x2c,%esp
 8048d5e:	c3                   	ret    

08048d5f <phase_5>:
 8048d5f:	53                   	push   %ebx
 8048d60:	83 ec 28             	sub    $0x28,%esp
 8048d63:	8b 5c 24 30          	mov    0x30(%esp),%ebx
 8048d67:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 8048d6d:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 8048d71:	31 c0                	xor    %eax,%eax
 8048d73:	89 1c 24             	mov    %ebx,(%esp)
 8048d76:	e8 80 02 00 00       	call   8048ffb <string_length>
 8048d7b:	83 f8 06             	cmp    $0x6,%eax
 8048d7e:	74 45                	je     8048dc5 <phase_5+0x66>
 8048d80:	e8 a0 03 00 00       	call   8049125 <explode_bomb>
 8048d85:	eb 3e                	jmp    8048dc5 <phase_5+0x66>
 8048d87:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 8048d8b:	83 e2 0f             	and    $0xf,%edx
 8048d8e:	0f b6 92 b0 a1 04 08 	movzbl 0x804a1b0(%edx),%edx
 8048d95:	88 54 04 15          	mov    %dl,0x15(%esp,%eax,1)
 8048d99:	83 c0 01             	add    $0x1,%eax
 8048d9c:	83 f8 06             	cmp    $0x6,%eax
 8048d9f:	75 e6                	jne    8048d87 <phase_5+0x28>
 8048da1:	c6 44 24 1b 00       	movb   $0x0,0x1b(%esp)
 8048da6:	c7 44 24 04 86 a1 04 	movl   $0x804a186,0x4(%esp)
 8048dad:	08 
 8048dae:	8d 44 24 15          	lea    0x15(%esp),%eax
 8048db2:	89 04 24             	mov    %eax,(%esp)
 8048db5:	e8 60 02 00 00       	call   804901a <strings_not_equal>
 8048dba:	85 c0                	test   %eax,%eax
 8048dbc:	74 0e                	je     8048dcc <phase_5+0x6d>
 8048dbe:	e8 62 03 00 00       	call   8049125 <explode_bomb>
 8048dc3:	eb 07                	jmp    8048dcc <phase_5+0x6d>
 8048dc5:	b8 00 00 00 00       	mov    $0x0,%eax
 8048dca:	eb bb                	jmp    8048d87 <phase_5+0x28>
 8048dcc:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 8048dd0:	65 33 05 14 00 00 00 	xor    %gs:0x14,%eax
 8048dd7:	74 05                	je     8048dde <phase_5+0x7f>
 8048dd9:	e8 e2 f9 ff ff       	call   80487c0 <__stack_chk_fail@plt>
 8048dde:	83 c4 28             	add    $0x28,%esp
 8048de1:	5b                   	pop    %ebx
 8048de2:	c3                   	ret    

08048de3 <phase_6>:
 8048de3:	56                   	push   %esi
 8048de4:	53                   	push   %ebx
 8048de5:	83 ec 44             	sub    $0x44,%esp
 8048de8:	8d 44 24 10          	lea    0x10(%esp),%eax
 8048dec:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048df0:	8b 44 24 50          	mov    0x50(%esp),%eax
 8048df4:	89 04 24             	mov    %eax,(%esp)
 8048df7:	e8 50 03 00 00       	call   804914c <read_six_numbers>
 8048dfc:	be 00 00 00 00       	mov    $0x0,%esi
 8048e01:	8b 44 b4 10          	mov    0x10(%esp,%esi,4),%eax
 8048e05:	83 e8 01             	sub    $0x1,%eax
 8048e08:	83 f8 05             	cmp    $0x5,%eax
 8048e0b:	76 05                	jbe    8048e12 <phase_6+0x2f>
 8048e0d:	e8 13 03 00 00       	call   8049125 <explode_bomb>
 8048e12:	83 c6 01             	add    $0x1,%esi
 8048e15:	83 fe 06             	cmp    $0x6,%esi
 8048e18:	75 07                	jne    8048e21 <phase_6+0x3e>
 8048e1a:	bb 00 00 00 00       	mov    $0x0,%ebx
 8048e1f:	eb 38                	jmp    8048e59 <phase_6+0x76>
 8048e21:	89 f3                	mov    %esi,%ebx
 8048e23:	8b 44 9c 10          	mov    0x10(%esp,%ebx,4),%eax
 8048e27:	39 44 b4 0c          	cmp    %eax,0xc(%esp,%esi,4)
 8048e2b:	75 05                	jne    8048e32 <phase_6+0x4f>
 8048e2d:	e8 f3 02 00 00       	call   8049125 <explode_bomb>
 8048e32:	83 c3 01             	add    $0x1,%ebx
 8048e35:	83 fb 05             	cmp    $0x5,%ebx
 8048e38:	7e e9                	jle    8048e23 <phase_6+0x40>
 8048e3a:	eb c5                	jmp    8048e01 <phase_6+0x1e>
 8048e3c:	8b 52 08             	mov    0x8(%edx),%edx
 8048e3f:	83 c0 01             	add    $0x1,%eax
 8048e42:	39 c8                	cmp    %ecx,%eax
 8048e44:	75 f6                	jne    8048e3c <phase_6+0x59>
 8048e46:	eb 05                	jmp    8048e4d <phase_6+0x6a>
 8048e48:	ba 3c c1 04 08       	mov    $0x804c13c,%edx
 8048e4d:	89 54 b4 28          	mov    %edx,0x28(%esp,%esi,4)
 8048e51:	83 c3 01             	add    $0x1,%ebx
 8048e54:	83 fb 06             	cmp    $0x6,%ebx
 8048e57:	74 17                	je     8048e70 <phase_6+0x8d>
 8048e59:	89 de                	mov    %ebx,%esi
 8048e5b:	8b 4c 9c 10          	mov    0x10(%esp,%ebx,4),%ecx
 8048e5f:	83 f9 01             	cmp    $0x1,%ecx
 8048e62:	7e e4                	jle    8048e48 <phase_6+0x65>
 8048e64:	b8 01 00 00 00       	mov    $0x1,%eax
 8048e69:	ba 3c c1 04 08       	mov    $0x804c13c,%edx
 8048e6e:	eb cc                	jmp    8048e3c <phase_6+0x59>
 8048e70:	8b 5c 24 28          	mov    0x28(%esp),%ebx
 8048e74:	8d 44 24 2c          	lea    0x2c(%esp),%eax
 8048e78:	8d 74 24 40          	lea    0x40(%esp),%esi
 8048e7c:	89 d9                	mov    %ebx,%ecx
 8048e7e:	8b 10                	mov    (%eax),%edx
 8048e80:	89 51 08             	mov    %edx,0x8(%ecx)
 8048e83:	83 c0 04             	add    $0x4,%eax
 8048e86:	39 f0                	cmp    %esi,%eax
 8048e88:	74 04                	je     8048e8e <phase_6+0xab>
 8048e8a:	89 d1                	mov    %edx,%ecx
 8048e8c:	eb f0                	jmp    8048e7e <phase_6+0x9b>
 8048e8e:	c7 42 08 00 00 00 00 	movl   $0x0,0x8(%edx)
 8048e95:	be 05 00 00 00       	mov    $0x5,%esi
 8048e9a:	8b 43 08             	mov    0x8(%ebx),%eax
 8048e9d:	8b 00                	mov    (%eax),%eax
 8048e9f:	39 03                	cmp    %eax,(%ebx)
 8048ea1:	7d 05                	jge    8048ea8 <phase_6+0xc5>
 8048ea3:	e8 7d 02 00 00       	call   8049125 <explode_bomb>
 8048ea8:	8b 5b 08             	mov    0x8(%ebx),%ebx
 8048eab:	83 ee 01             	sub    $0x1,%esi
 8048eae:	75 ea                	jne    8048e9a <phase_6+0xb7>
 8048eb0:	83 c4 44             	add    $0x44,%esp
 8048eb3:	5b                   	pop    %ebx
 8048eb4:	5e                   	pop    %esi
 8048eb5:	c3                   	ret    

08048eb6 <fun7>:
 8048eb6:	53                   	push   %ebx
 8048eb7:	83 ec 18             	sub    $0x18,%esp
 8048eba:	8b 54 24 20          	mov    0x20(%esp),%edx
 8048ebe:	8b 4c 24 24          	mov    0x24(%esp),%ecx
 8048ec2:	85 d2                	test   %edx,%edx
 8048ec4:	74 37                	je     8048efd <fun7+0x47>
 8048ec6:	8b 1a                	mov    (%edx),%ebx
 8048ec8:	39 cb                	cmp    %ecx,%ebx
 8048eca:	7e 13                	jle    8048edf <fun7+0x29>
 8048ecc:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048ed0:	8b 42 04             	mov    0x4(%edx),%eax
 8048ed3:	89 04 24             	mov    %eax,(%esp)
 8048ed6:	e8 db ff ff ff       	call   8048eb6 <fun7>
 8048edb:	01 c0                	add    %eax,%eax
 8048edd:	eb 23                	jmp    8048f02 <fun7+0x4c>
 8048edf:	b8 00 00 00 00       	mov    $0x0,%eax
 8048ee4:	39 cb                	cmp    %ecx,%ebx
 8048ee6:	74 1a                	je     8048f02 <fun7+0x4c>
 8048ee8:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 8048eec:	8b 42 08             	mov    0x8(%edx),%eax
 8048eef:	89 04 24             	mov    %eax,(%esp)
 8048ef2:	e8 bf ff ff ff       	call   8048eb6 <fun7>
 8048ef7:	8d 44 00 01          	lea    0x1(%eax,%eax,1),%eax
 8048efb:	eb 05                	jmp    8048f02 <fun7+0x4c>
 8048efd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8048f02:	83 c4 18             	add    $0x18,%esp
 8048f05:	5b                   	pop    %ebx
 8048f06:	c3                   	ret    

08048f07 <secret_phase>:
 8048f07:	53                   	push   %ebx
 8048f08:	83 ec 18             	sub    $0x18,%esp
 8048f0b:	e8 8c 02 00 00       	call   804919c <read_line>
 8048f10:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 8048f17:	00 
 8048f18:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8048f1f:	00 
 8048f20:	89 04 24             	mov    %eax,(%esp)
 8048f23:	e8 a8 f9 ff ff       	call   80488d0 <strtol@plt>
 8048f28:	89 c3                	mov    %eax,%ebx
 8048f2a:	8d 40 ff             	lea    -0x1(%eax),%eax
 8048f2d:	3d e8 03 00 00       	cmp    $0x3e8,%eax
 8048f32:	76 05                	jbe    8048f39 <secret_phase+0x32>
 8048f34:	e8 ec 01 00 00       	call   8049125 <explode_bomb>
 8048f39:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 8048f3d:	c7 04 24 88 c0 04 08 	movl   $0x804c088,(%esp)
 8048f44:	e8 6d ff ff ff       	call   8048eb6 <fun7>
 8048f49:	83 f8 03             	cmp    $0x3,%eax
 8048f4c:	74 05                	je     8048f53 <secret_phase+0x4c>
 8048f4e:	e8 d2 01 00 00       	call   8049125 <explode_bomb>
 8048f53:	c7 04 24 60 a1 04 08 	movl   $0x804a160,(%esp)
 8048f5a:	e8 91 f8 ff ff       	call   80487f0 <puts@plt>
 8048f5f:	e8 32 03 00 00       	call   8049296 <phase_defused>
 8048f64:	83 c4 18             	add    $0x18,%esp
 8048f67:	5b                   	pop    %ebx
 8048f68:	c3                   	ret    
 8048f69:	66 90                	xchg   %ax,%ax
 8048f6b:	66 90                	xchg   %ax,%ax
 8048f6d:	66 90                	xchg   %ax,%ax
 8048f6f:	90                   	nop

08048f70 <sig_handler>:
 8048f70:	83 ec 1c             	sub    $0x1c,%esp
 8048f73:	c7 04 24 c0 a1 04 08 	movl   $0x804a1c0,(%esp)
 8048f7a:	e8 71 f8 ff ff       	call   80487f0 <puts@plt>
 8048f7f:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 8048f86:	e8 15 f8 ff ff       	call   80487a0 <sleep@plt>
 8048f8b:	c7 44 24 04 82 a2 04 	movl   $0x804a282,0x4(%esp)
 8048f92:	08 
 8048f93:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048f9a:	e8 f1 f8 ff ff       	call   8048890 <__printf_chk@plt>
 8048f9f:	a1 c0 c3 04 08       	mov    0x804c3c0,%eax
 8048fa4:	89 04 24             	mov    %eax,(%esp)
 8048fa7:	e8 c4 f7 ff ff       	call   8048770 <fflush@plt>
 8048fac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048fb3:	e8 e8 f7 ff ff       	call   80487a0 <sleep@plt>
 8048fb8:	c7 04 24 8a a2 04 08 	movl   $0x804a28a,(%esp)
 8048fbf:	e8 2c f8 ff ff       	call   80487f0 <puts@plt>
 8048fc4:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
 8048fcb:	e8 60 f8 ff ff       	call   8048830 <exit@plt>

08048fd0 <invalid_phase>:
 8048fd0:	83 ec 1c             	sub    $0x1c,%esp
 8048fd3:	8b 44 24 20          	mov    0x20(%esp),%eax
 8048fd7:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048fdb:	c7 44 24 04 92 a2 04 	movl   $0x804a292,0x4(%esp)
 8048fe2:	08 
 8048fe3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048fea:	e8 a1 f8 ff ff       	call   8048890 <__printf_chk@plt>
 8048fef:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8048ff6:	e8 35 f8 ff ff       	call   8048830 <exit@plt>

08048ffb <string_length>:
 8048ffb:	8b 54 24 04          	mov    0x4(%esp),%edx
 8048fff:	80 3a 00             	cmpb   $0x0,(%edx)
 8049002:	74 10                	je     8049014 <string_length+0x19>
 8049004:	b8 00 00 00 00       	mov    $0x0,%eax
 8049009:	83 c0 01             	add    $0x1,%eax
 804900c:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 8049010:	75 f7                	jne    8049009 <string_length+0xe>
 8049012:	f3 c3                	repz ret 
 8049014:	b8 00 00 00 00       	mov    $0x0,%eax
 8049019:	c3                   	ret    

0804901a <strings_not_equal>:
 804901a:	57                   	push   %edi
 804901b:	56                   	push   %esi
 804901c:	53                   	push   %ebx
 804901d:	83 ec 04             	sub    $0x4,%esp
 8049020:	8b 5c 24 14          	mov    0x14(%esp),%ebx
 8049024:	8b 74 24 18          	mov    0x18(%esp),%esi
 8049028:	89 1c 24             	mov    %ebx,(%esp)
 804902b:	e8 cb ff ff ff       	call   8048ffb <string_length>
 8049030:	89 c7                	mov    %eax,%edi
 8049032:	89 34 24             	mov    %esi,(%esp)
 8049035:	e8 c1 ff ff ff       	call   8048ffb <string_length>
 804903a:	ba 01 00 00 00       	mov    $0x1,%edx
 804903f:	39 c7                	cmp    %eax,%edi
 8049041:	75 3a                	jne    804907d <strings_not_equal+0x63>
 8049043:	0f b6 03             	movzbl (%ebx),%eax
 8049046:	84 c0                	test   %al,%al
 8049048:	74 20                	je     804906a <strings_not_equal+0x50>
 804904a:	3a 06                	cmp    (%esi),%al
 804904c:	74 08                	je     8049056 <strings_not_equal+0x3c>
 804904e:	66 90                	xchg   %ax,%ax
 8049050:	eb 1f                	jmp    8049071 <strings_not_equal+0x57>
 8049052:	3a 06                	cmp    (%esi),%al
 8049054:	75 22                	jne    8049078 <strings_not_equal+0x5e>
 8049056:	83 c3 01             	add    $0x1,%ebx
 8049059:	83 c6 01             	add    $0x1,%esi
 804905c:	0f b6 03             	movzbl (%ebx),%eax
 804905f:	84 c0                	test   %al,%al
 8049061:	75 ef                	jne    8049052 <strings_not_equal+0x38>
 8049063:	ba 00 00 00 00       	mov    $0x0,%edx
 8049068:	eb 13                	jmp    804907d <strings_not_equal+0x63>
 804906a:	ba 00 00 00 00       	mov    $0x0,%edx
 804906f:	eb 0c                	jmp    804907d <strings_not_equal+0x63>
 8049071:	ba 01 00 00 00       	mov    $0x1,%edx
 8049076:	eb 05                	jmp    804907d <strings_not_equal+0x63>
 8049078:	ba 01 00 00 00       	mov    $0x1,%edx
 804907d:	89 d0                	mov    %edx,%eax
 804907f:	83 c4 04             	add    $0x4,%esp
 8049082:	5b                   	pop    %ebx
 8049083:	5e                   	pop    %esi
 8049084:	5f                   	pop    %edi
 8049085:	c3                   	ret    

08049086 <initialize_bomb>:
 8049086:	83 ec 1c             	sub    $0x1c,%esp
 8049089:	c7 44 24 04 70 8f 04 	movl   $0x8048f70,0x4(%esp)
 8049090:	08 
 8049091:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049098:	e8 f3 f6 ff ff       	call   8048790 <signal@plt>
 804909d:	83 c4 1c             	add    $0x1c,%esp
 80490a0:	c3                   	ret    

080490a1 <initialize_bomb_solve>:
 80490a1:	f3 c3                	repz ret 

080490a3 <blank_line>:
 80490a3:	56                   	push   %esi
 80490a4:	53                   	push   %ebx
 80490a5:	83 ec 04             	sub    $0x4,%esp
 80490a8:	8b 5c 24 10          	mov    0x10(%esp),%ebx
 80490ac:	eb 16                	jmp    80490c4 <blank_line+0x21>
 80490ae:	e8 4d f8 ff ff       	call   8048900 <__ctype_b_loc@plt>
 80490b3:	83 c3 01             	add    $0x1,%ebx
 80490b6:	89 f2                	mov    %esi,%edx
 80490b8:	0f be f2             	movsbl %dl,%esi
 80490bb:	8b 00                	mov    (%eax),%eax
 80490bd:	f6 44 70 01 20       	testb  $0x20,0x1(%eax,%esi,2)
 80490c2:	74 10                	je     80490d4 <blank_line+0x31>
 80490c4:	0f b6 33             	movzbl (%ebx),%esi
 80490c7:	89 f0                	mov    %esi,%eax
 80490c9:	84 c0                	test   %al,%al
 80490cb:	75 e1                	jne    80490ae <blank_line+0xb>
 80490cd:	b8 01 00 00 00       	mov    $0x1,%eax
 80490d2:	eb 05                	jmp    80490d9 <blank_line+0x36>
 80490d4:	b8 00 00 00 00       	mov    $0x0,%eax
 80490d9:	83 c4 04             	add    $0x4,%esp
 80490dc:	5b                   	pop    %ebx
 80490dd:	5e                   	pop    %esi
 80490de:	c3                   	ret    

080490df <skip>:
 80490df:	53                   	push   %ebx
 80490e0:	83 ec 18             	sub    $0x18,%esp
 80490e3:	a1 cc c3 04 08       	mov    0x804c3cc,%eax
 80490e8:	89 44 24 08          	mov    %eax,0x8(%esp)
 80490ec:	c7 44 24 04 50 00 00 	movl   $0x50,0x4(%esp)
 80490f3:	00 
 80490f4:	a1 c8 c3 04 08       	mov    0x804c3c8,%eax
 80490f9:	8d 04 80             	lea    (%eax,%eax,4),%eax
 80490fc:	c1 e0 04             	shl    $0x4,%eax
 80490ff:	05 e0 c3 04 08       	add    $0x804c3e0,%eax
 8049104:	89 04 24             	mov    %eax,(%esp)
 8049107:	e8 74 f6 ff ff       	call   8048780 <fgets@plt>
 804910c:	89 c3                	mov    %eax,%ebx
 804910e:	85 c0                	test   %eax,%eax
 8049110:	74 0c                	je     804911e <skip+0x3f>
 8049112:	89 04 24             	mov    %eax,(%esp)
 8049115:	e8 89 ff ff ff       	call   80490a3 <blank_line>
 804911a:	85 c0                	test   %eax,%eax
 804911c:	75 c5                	jne    80490e3 <skip+0x4>
 804911e:	89 d8                	mov    %ebx,%eax
 8049120:	83 c4 18             	add    $0x18,%esp
 8049123:	5b                   	pop    %ebx
 8049124:	c3                   	ret    

08049125 <explode_bomb>:
 8049125:	83 ec 1c             	sub    $0x1c,%esp
 8049128:	c7 04 24 a3 a2 04 08 	movl   $0x804a2a3,(%esp)
 804912f:	e8 bc f6 ff ff       	call   80487f0 <puts@plt>
 8049134:	c7 04 24 ac a2 04 08 	movl   $0x804a2ac,(%esp)
 804913b:	e8 b0 f6 ff ff       	call   80487f0 <puts@plt>
 8049140:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 8049147:	e8 e4 f6 ff ff       	call   8048830 <exit@plt>

0804914c <read_six_numbers>:
 804914c:	83 ec 2c             	sub    $0x2c,%esp
 804914f:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049153:	8d 50 14             	lea    0x14(%eax),%edx
 8049156:	89 54 24 1c          	mov    %edx,0x1c(%esp)
 804915a:	8d 50 10             	lea    0x10(%eax),%edx
 804915d:	89 54 24 18          	mov    %edx,0x18(%esp)
 8049161:	8d 50 0c             	lea    0xc(%eax),%edx
 8049164:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049168:	8d 50 08             	lea    0x8(%eax),%edx
 804916b:	89 54 24 10          	mov    %edx,0x10(%esp)
 804916f:	8d 50 04             	lea    0x4(%eax),%edx
 8049172:	89 54 24 0c          	mov    %edx,0xc(%esp)
 8049176:	89 44 24 08          	mov    %eax,0x8(%esp)
 804917a:	c7 44 24 04 c3 a2 04 	movl   $0x804a2c3,0x4(%esp)
 8049181:	08 
 8049182:	8b 44 24 30          	mov    0x30(%esp),%eax
 8049186:	89 04 24             	mov    %eax,(%esp)
 8049189:	e8 d2 f6 ff ff       	call   8048860 <__isoc99_sscanf@plt>
 804918e:	83 f8 05             	cmp    $0x5,%eax
 8049191:	7f 05                	jg     8049198 <read_six_numbers+0x4c>
 8049193:	e8 8d ff ff ff       	call   8049125 <explode_bomb>
 8049198:	83 c4 2c             	add    $0x2c,%esp
 804919b:	c3                   	ret    

0804919c <read_line>:
 804919c:	57                   	push   %edi
 804919d:	56                   	push   %esi
 804919e:	53                   	push   %ebx
 804919f:	83 ec 10             	sub    $0x10,%esp
 80491a2:	e8 38 ff ff ff       	call   80490df <skip>
 80491a7:	85 c0                	test   %eax,%eax
 80491a9:	75 6c                	jne    8049217 <read_line+0x7b>
 80491ab:	a1 a4 c3 04 08       	mov    0x804c3a4,%eax
 80491b0:	39 05 cc c3 04 08    	cmp    %eax,0x804c3cc
 80491b6:	75 18                	jne    80491d0 <read_line+0x34>
 80491b8:	c7 04 24 d5 a2 04 08 	movl   $0x804a2d5,(%esp)
 80491bf:	e8 2c f6 ff ff       	call   80487f0 <puts@plt>
 80491c4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 80491cb:	e8 60 f6 ff ff       	call   8048830 <exit@plt>
 80491d0:	c7 04 24 f3 a2 04 08 	movl   $0x804a2f3,(%esp)
 80491d7:	e8 04 f6 ff ff       	call   80487e0 <getenv@plt>
 80491dc:	85 c0                	test   %eax,%eax
 80491de:	74 0c                	je     80491ec <read_line+0x50>
 80491e0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80491e7:	e8 44 f6 ff ff       	call   8048830 <exit@plt>
 80491ec:	a1 a4 c3 04 08       	mov    0x804c3a4,%eax
 80491f1:	a3 cc c3 04 08       	mov    %eax,0x804c3cc
 80491f6:	e8 e4 fe ff ff       	call   80490df <skip>
 80491fb:	85 c0                	test   %eax,%eax
 80491fd:	75 18                	jne    8049217 <read_line+0x7b>
 80491ff:	c7 04 24 d5 a2 04 08 	movl   $0x804a2d5,(%esp)
 8049206:	e8 e5 f5 ff ff       	call   80487f0 <puts@plt>
 804920b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049212:	e8 19 f6 ff ff       	call   8048830 <exit@plt>
 8049217:	8b 15 c8 c3 04 08    	mov    0x804c3c8,%edx
 804921d:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 8049220:	c1 e3 04             	shl    $0x4,%ebx
 8049223:	81 c3 e0 c3 04 08    	add    $0x804c3e0,%ebx
 8049229:	89 df                	mov    %ebx,%edi
 804922b:	b8 00 00 00 00       	mov    $0x0,%eax
 8049230:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 8049235:	f2 ae                	repnz scas %es:(%edi),%al
 8049237:	f7 d1                	not    %ecx
 8049239:	83 e9 01             	sub    $0x1,%ecx
 804923c:	83 f9 4e             	cmp    $0x4e,%ecx
 804923f:	7e 35                	jle    8049276 <read_line+0xda>
 8049241:	c7 04 24 fe a2 04 08 	movl   $0x804a2fe,(%esp)
 8049248:	e8 a3 f5 ff ff       	call   80487f0 <puts@plt>
 804924d:	a1 c8 c3 04 08       	mov    0x804c3c8,%eax
 8049252:	8d 50 01             	lea    0x1(%eax),%edx
 8049255:	89 15 c8 c3 04 08    	mov    %edx,0x804c3c8
 804925b:	6b c0 50             	imul   $0x50,%eax,%eax
 804925e:	05 e0 c3 04 08       	add    $0x804c3e0,%eax
 8049263:	be 19 a3 04 08       	mov    $0x804a319,%esi
 8049268:	b9 04 00 00 00       	mov    $0x4,%ecx
 804926d:	89 c7                	mov    %eax,%edi
 804926f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 8049271:	e8 af fe ff ff       	call   8049125 <explode_bomb>
 8049276:	8d 04 92             	lea    (%edx,%edx,4),%eax
 8049279:	c1 e0 04             	shl    $0x4,%eax
 804927c:	c6 84 01 df c3 04 08 	movb   $0x0,0x804c3df(%ecx,%eax,1)
 8049283:	00 
 8049284:	83 c2 01             	add    $0x1,%edx
 8049287:	89 15 c8 c3 04 08    	mov    %edx,0x804c3c8
 804928d:	89 d8                	mov    %ebx,%eax
 804928f:	83 c4 10             	add    $0x10,%esp
 8049292:	5b                   	pop    %ebx
 8049293:	5e                   	pop    %esi
 8049294:	5f                   	pop    %edi
 8049295:	c3                   	ret    

08049296 <phase_defused>:
 8049296:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
 804929c:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 80492a2:	89 44 24 7c          	mov    %eax,0x7c(%esp)
 80492a6:	31 c0                	xor    %eax,%eax
 80492a8:	83 3d c8 c3 04 08 06 	cmpl   $0x6,0x804c3c8
 80492af:	75 72                	jne    8049323 <phase_defused+0x8d>
 80492b1:	8d 44 24 2c          	lea    0x2c(%esp),%eax
 80492b5:	89 44 24 10          	mov    %eax,0x10(%esp)
 80492b9:	8d 44 24 28          	lea    0x28(%esp),%eax
 80492bd:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80492c1:	8d 44 24 24          	lea    0x24(%esp),%eax
 80492c5:	89 44 24 08          	mov    %eax,0x8(%esp)
 80492c9:	c7 44 24 04 29 a3 04 	movl   $0x804a329,0x4(%esp)
 80492d0:	08 
 80492d1:	c7 04 24 d0 c4 04 08 	movl   $0x804c4d0,(%esp)
 80492d8:	e8 83 f5 ff ff       	call   8048860 <__isoc99_sscanf@plt>
 80492dd:	83 f8 03             	cmp    $0x3,%eax
 80492e0:	75 35                	jne    8049317 <phase_defused+0x81>
 80492e2:	c7 44 24 04 32 a3 04 	movl   $0x804a332,0x4(%esp)
 80492e9:	08 
 80492ea:	8d 44 24 2c          	lea    0x2c(%esp),%eax
 80492ee:	89 04 24             	mov    %eax,(%esp)
 80492f1:	e8 24 fd ff ff       	call   804901a <strings_not_equal>
 80492f6:	85 c0                	test   %eax,%eax
 80492f8:	75 1d                	jne    8049317 <phase_defused+0x81>
 80492fa:	c7 04 24 f8 a1 04 08 	movl   $0x804a1f8,(%esp)
 8049301:	e8 ea f4 ff ff       	call   80487f0 <puts@plt>
 8049306:	c7 04 24 20 a2 04 08 	movl   $0x804a220,(%esp)
 804930d:	e8 de f4 ff ff       	call   80487f0 <puts@plt>
 8049312:	e8 f0 fb ff ff       	call   8048f07 <secret_phase>
 8049317:	c7 04 24 58 a2 04 08 	movl   $0x804a258,(%esp)
 804931e:	e8 cd f4 ff ff       	call   80487f0 <puts@plt>
 8049323:	8b 44 24 7c          	mov    0x7c(%esp),%eax
 8049327:	65 33 05 14 00 00 00 	xor    %gs:0x14,%eax
 804932e:	74 05                	je     8049335 <phase_defused+0x9f>
 8049330:	e8 8b f4 ff ff       	call   80487c0 <__stack_chk_fail@plt>
 8049335:	81 c4 8c 00 00 00    	add    $0x8c,%esp
 804933b:	c3                   	ret    
 804933c:	66 90                	xchg   %ax,%ax
 804933e:	66 90                	xchg   %ax,%ax

08049340 <sigalrm_handler>:
 8049340:	83 ec 1c             	sub    $0x1c,%esp
 8049343:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 804934a:	00 
 804934b:	c7 44 24 08 88 a3 04 	movl   $0x804a388,0x8(%esp)
 8049352:	08 
 8049353:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804935a:	00 
 804935b:	a1 a0 c3 04 08       	mov    0x804c3a0,%eax
 8049360:	89 04 24             	mov    %eax,(%esp)
 8049363:	e8 48 f5 ff ff       	call   80488b0 <__fprintf_chk@plt>
 8049368:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804936f:	e8 bc f4 ff ff       	call   8048830 <exit@plt>

08049374 <rio_readlineb>:
 8049374:	55                   	push   %ebp
 8049375:	57                   	push   %edi
 8049376:	56                   	push   %esi
 8049377:	53                   	push   %ebx
 8049378:	83 ec 3c             	sub    $0x3c,%esp
 804937b:	89 d5                	mov    %edx,%ebp
 804937d:	83 f9 01             	cmp    $0x1,%ecx
 8049380:	0f 86 d0 00 00 00    	jbe    8049456 <rio_readlineb+0xe2>
 8049386:	89 c3                	mov    %eax,%ebx
 8049388:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
 804938c:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
 8049393:	00 
 8049394:	8d 78 0c             	lea    0xc(%eax),%edi
 8049397:	eb 33                	jmp    80493cc <rio_readlineb+0x58>
 8049399:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
 80493a0:	00 
 80493a1:	89 7c 24 04          	mov    %edi,0x4(%esp)
 80493a5:	8b 03                	mov    (%ebx),%eax
 80493a7:	89 04 24             	mov    %eax,(%esp)
 80493aa:	e8 b1 f3 ff ff       	call   8048760 <read@plt>
 80493af:	89 43 04             	mov    %eax,0x4(%ebx)
 80493b2:	85 c0                	test   %eax,%eax
 80493b4:	79 0f                	jns    80493c5 <rio_readlineb+0x51>
 80493b6:	e8 c5 f4 ff ff       	call   8048880 <__errno_location@plt>
 80493bb:	83 38 04             	cmpl   $0x4,(%eax)
 80493be:	74 0c                	je     80493cc <rio_readlineb+0x58>
 80493c0:	e9 a3 00 00 00       	jmp    8049468 <rio_readlineb+0xf4>
 80493c5:	85 c0                	test   %eax,%eax
 80493c7:	74 6e                	je     8049437 <rio_readlineb+0xc3>
 80493c9:	89 7b 08             	mov    %edi,0x8(%ebx)
 80493cc:	8b 73 04             	mov    0x4(%ebx),%esi
 80493cf:	85 f6                	test   %esi,%esi
 80493d1:	7e c6                	jle    8049399 <rio_readlineb+0x25>
 80493d3:	85 f6                	test   %esi,%esi
 80493d5:	0f 95 c0             	setne  %al
 80493d8:	0f b6 c0             	movzbl %al,%eax
 80493db:	89 44 24 14          	mov    %eax,0x14(%esp)
 80493df:	8b 4b 08             	mov    0x8(%ebx),%ecx
 80493e2:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 80493e9:	00 
 80493ea:	89 44 24 08          	mov    %eax,0x8(%esp)
 80493ee:	89 4c 24 18          	mov    %ecx,0x18(%esp)
 80493f2:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 80493f6:	8d 54 24 2f          	lea    0x2f(%esp),%edx
 80493fa:	89 14 24             	mov    %edx,(%esp)
 80493fd:	e8 0e f4 ff ff       	call   8048810 <__memcpy_chk@plt>
 8049402:	8b 4c 24 18          	mov    0x18(%esp),%ecx
 8049406:	8b 54 24 14          	mov    0x14(%esp),%edx
 804940a:	01 d1                	add    %edx,%ecx
 804940c:	89 4b 08             	mov    %ecx,0x8(%ebx)
 804940f:	29 d6                	sub    %edx,%esi
 8049411:	89 73 04             	mov    %esi,0x4(%ebx)
 8049414:	83 fa 01             	cmp    $0x1,%edx
 8049417:	75 11                	jne    804942a <rio_readlineb+0xb6>
 8049419:	83 c5 01             	add    $0x1,%ebp
 804941c:	0f b6 44 24 2f       	movzbl 0x2f(%esp),%eax
 8049421:	88 45 ff             	mov    %al,-0x1(%ebp)
 8049424:	3c 0a                	cmp    $0xa,%al
 8049426:	75 1a                	jne    8049442 <rio_readlineb+0xce>
 8049428:	eb 34                	jmp    804945e <rio_readlineb+0xea>
 804942a:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 804942f:	75 3e                	jne    804946f <rio_readlineb+0xfb>
 8049431:	8b 44 24 10          	mov    0x10(%esp),%eax
 8049435:	eb 04                	jmp    804943b <rio_readlineb+0xc7>
 8049437:	8b 44 24 10          	mov    0x10(%esp),%eax
 804943b:	83 f8 01             	cmp    $0x1,%eax
 804943e:	75 1e                	jne    804945e <rio_readlineb+0xea>
 8049440:	eb 34                	jmp    8049476 <rio_readlineb+0x102>
 8049442:	83 44 24 10 01       	addl   $0x1,0x10(%esp)
 8049447:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 804944b:	39 44 24 10          	cmp    %eax,0x10(%esp)
 804944f:	74 0d                	je     804945e <rio_readlineb+0xea>
 8049451:	e9 76 ff ff ff       	jmp    80493cc <rio_readlineb+0x58>
 8049456:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
 804945d:	00 
 804945e:	c6 45 00 00          	movb   $0x0,0x0(%ebp)
 8049462:	8b 44 24 10          	mov    0x10(%esp),%eax
 8049466:	eb 13                	jmp    804947b <rio_readlineb+0x107>
 8049468:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804946d:	eb 0c                	jmp    804947b <rio_readlineb+0x107>
 804946f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049474:	eb 05                	jmp    804947b <rio_readlineb+0x107>
 8049476:	b8 00 00 00 00       	mov    $0x0,%eax
 804947b:	83 c4 3c             	add    $0x3c,%esp
 804947e:	5b                   	pop    %ebx
 804947f:	5e                   	pop    %esi
 8049480:	5f                   	pop    %edi
 8049481:	5d                   	pop    %ebp
 8049482:	c3                   	ret    

08049483 <submitr>:
 8049483:	55                   	push   %ebp
 8049484:	57                   	push   %edi
 8049485:	56                   	push   %esi
 8049486:	53                   	push   %ebx
 8049487:	81 ec 7c a0 00 00    	sub    $0xa07c,%esp
 804948d:	8b b4 24 90 a0 00 00 	mov    0xa090(%esp),%esi
 8049494:	8b 84 24 98 a0 00 00 	mov    0xa098(%esp),%eax
 804949b:	89 44 24 28          	mov    %eax,0x28(%esp)
 804949f:	8b 84 24 9c a0 00 00 	mov    0xa09c(%esp),%eax
 80494a6:	89 44 24 2c          	mov    %eax,0x2c(%esp)
 80494aa:	8b 84 24 a0 a0 00 00 	mov    0xa0a0(%esp),%eax
 80494b1:	89 44 24 30          	mov    %eax,0x30(%esp)
 80494b5:	8b 9c 24 a4 a0 00 00 	mov    0xa0a4(%esp),%ebx
 80494bc:	8b 84 24 a8 a0 00 00 	mov    0xa0a8(%esp),%eax
 80494c3:	89 44 24 34          	mov    %eax,0x34(%esp)
 80494c7:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 80494cd:	89 84 24 6c a0 00 00 	mov    %eax,0xa06c(%esp)
 80494d4:	31 c0                	xor    %eax,%eax
 80494d6:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
 80494dd:	00 
 80494de:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 80494e5:	00 
 80494e6:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80494ed:	00 
 80494ee:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 80494f5:	e8 a6 f3 ff ff       	call   80488a0 <socket@plt>
 80494fa:	89 c5                	mov    %eax,%ebp
 80494fc:	85 c0                	test   %eax,%eax
 80494fe:	79 52                	jns    8049552 <submitr+0xcf>
 8049500:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049504:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 804950a:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 8049511:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 8049518:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 804951f:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 8049526:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 804952d:	c7 40 18 63 72 65 61 	movl   $0x61657263,0x18(%eax)
 8049534:	c7 40 1c 74 65 20 73 	movl   $0x73206574,0x1c(%eax)
 804953b:	c7 40 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%eax)
 8049542:	66 c7 40 24 74 00    	movw   $0x74,0x24(%eax)
 8049548:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804954d:	e9 37 06 00 00       	jmp    8049b89 <submitr+0x706>
 8049552:	89 34 24             	mov    %esi,(%esp)
 8049555:	e8 66 f3 ff ff       	call   80488c0 <gethostbyname@plt>
 804955a:	85 c0                	test   %eax,%eax
 804955c:	75 6c                	jne    80495ca <submitr+0x147>
 804955e:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049562:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 8049568:	c7 40 04 72 3a 20 44 	movl   $0x44203a72,0x4(%eax)
 804956f:	c7 40 08 4e 53 20 69 	movl   $0x6920534e,0x8(%eax)
 8049576:	c7 40 0c 73 20 75 6e 	movl   $0x6e752073,0xc(%eax)
 804957d:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 8049584:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 804958b:	c7 40 18 72 65 73 6f 	movl   $0x6f736572,0x18(%eax)
 8049592:	c7 40 1c 6c 76 65 20 	movl   $0x2065766c,0x1c(%eax)
 8049599:	c7 40 20 73 65 72 76 	movl   $0x76726573,0x20(%eax)
 80495a0:	c7 40 24 65 72 20 61 	movl   $0x61207265,0x24(%eax)
 80495a7:	c7 40 28 64 64 72 65 	movl   $0x65726464,0x28(%eax)
 80495ae:	66 c7 40 2c 73 73    	movw   $0x7373,0x2c(%eax)
 80495b4:	c6 40 2e 00          	movb   $0x0,0x2e(%eax)
 80495b8:	89 2c 24             	mov    %ebp,(%esp)
 80495bb:	e8 30 f3 ff ff       	call   80488f0 <close@plt>
 80495c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80495c5:	e9 bf 05 00 00       	jmp    8049b89 <submitr+0x706>
 80495ca:	8d 74 24 50          	lea    0x50(%esp),%esi
 80495ce:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
 80495d5:	00 
 80495d6:	c7 44 24 54 00 00 00 	movl   $0x0,0x54(%esp)
 80495dd:	00 
 80495de:	c7 44 24 58 00 00 00 	movl   $0x0,0x58(%esp)
 80495e5:	00 
 80495e6:	c7 44 24 5c 00 00 00 	movl   $0x0,0x5c(%esp)
 80495ed:	00 
 80495ee:	66 c7 44 24 50 02 00 	movw   $0x2,0x50(%esp)
 80495f5:	c7 44 24 0c 0c 00 00 	movl   $0xc,0xc(%esp)
 80495fc:	00 
 80495fd:	8b 50 0c             	mov    0xc(%eax),%edx
 8049600:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049604:	8b 40 10             	mov    0x10(%eax),%eax
 8049607:	8b 00                	mov    (%eax),%eax
 8049609:	89 44 24 04          	mov    %eax,0x4(%esp)
 804960d:	8d 44 24 54          	lea    0x54(%esp),%eax
 8049611:	89 04 24             	mov    %eax,(%esp)
 8049614:	e8 e7 f1 ff ff       	call   8048800 <__memmove_chk@plt>
 8049619:	0f b7 84 24 94 a0 00 	movzwl 0xa094(%esp),%eax
 8049620:	00 
 8049621:	66 c1 c8 08          	ror    $0x8,%ax
 8049625:	66 89 44 24 52       	mov    %ax,0x52(%esp)
 804962a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 8049631:	00 
 8049632:	89 74 24 04          	mov    %esi,0x4(%esp)
 8049636:	89 2c 24             	mov    %ebp,(%esp)
 8049639:	e8 a2 f2 ff ff       	call   80488e0 <connect@plt>
 804963e:	85 c0                	test   %eax,%eax
 8049640:	79 5e                	jns    80496a0 <submitr+0x21d>
 8049642:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049646:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 804964c:	c7 40 04 72 3a 20 55 	movl   $0x55203a72,0x4(%eax)
 8049653:	c7 40 08 6e 61 62 6c 	movl   $0x6c62616e,0x8(%eax)
 804965a:	c7 40 0c 65 20 74 6f 	movl   $0x6f742065,0xc(%eax)
 8049661:	c7 40 10 20 63 6f 6e 	movl   $0x6e6f6320,0x10(%eax)
 8049668:	c7 40 14 6e 65 63 74 	movl   $0x7463656e,0x14(%eax)
 804966f:	c7 40 18 20 74 6f 20 	movl   $0x206f7420,0x18(%eax)
 8049676:	c7 40 1c 74 68 65 20 	movl   $0x20656874,0x1c(%eax)
 804967d:	c7 40 20 73 65 72 76 	movl   $0x76726573,0x20(%eax)
 8049684:	66 c7 40 24 65 72    	movw   $0x7265,0x24(%eax)
 804968a:	c6 40 26 00          	movb   $0x0,0x26(%eax)
 804968e:	89 2c 24             	mov    %ebp,(%esp)
 8049691:	e8 5a f2 ff ff       	call   80488f0 <close@plt>
 8049696:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804969b:	e9 e9 04 00 00       	jmp    8049b89 <submitr+0x706>
 80496a0:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 80496a5:	89 df                	mov    %ebx,%edi
 80496a7:	b8 00 00 00 00       	mov    $0x0,%eax
 80496ac:	89 d1                	mov    %edx,%ecx
 80496ae:	f2 ae                	repnz scas %es:(%edi),%al
 80496b0:	f7 d1                	not    %ecx
 80496b2:	89 ce                	mov    %ecx,%esi
 80496b4:	8b 7c 24 28          	mov    0x28(%esp),%edi
 80496b8:	89 d1                	mov    %edx,%ecx
 80496ba:	f2 ae                	repnz scas %es:(%edi),%al
 80496bc:	89 4c 24 38          	mov    %ecx,0x38(%esp)
 80496c0:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
 80496c4:	89 d1                	mov    %edx,%ecx
 80496c6:	f2 ae                	repnz scas %es:(%edi),%al
 80496c8:	f7 d1                	not    %ecx
 80496ca:	89 4c 24 3c          	mov    %ecx,0x3c(%esp)
 80496ce:	8b 7c 24 30          	mov    0x30(%esp),%edi
 80496d2:	89 d1                	mov    %edx,%ecx
 80496d4:	f2 ae                	repnz scas %es:(%edi),%al
 80496d6:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 80496da:	2b 44 24 38          	sub    0x38(%esp),%eax
 80496de:	29 c8                	sub    %ecx,%eax
 80496e0:	89 c2                	mov    %eax,%edx
 80496e2:	8d 44 76 fd          	lea    -0x3(%esi,%esi,2),%eax
 80496e6:	8d 44 02 7b          	lea    0x7b(%edx,%eax,1),%eax
 80496ea:	3d 00 20 00 00       	cmp    $0x2000,%eax
 80496ef:	76 77                	jbe    8049768 <submitr+0x2e5>
 80496f1:	8b 44 24 34          	mov    0x34(%esp),%eax
 80496f5:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 80496fb:	c7 40 04 72 3a 20 52 	movl   $0x52203a72,0x4(%eax)
 8049702:	c7 40 08 65 73 75 6c 	movl   $0x6c757365,0x8(%eax)
 8049709:	c7 40 0c 74 20 73 74 	movl   $0x74732074,0xc(%eax)
 8049710:	c7 40 10 72 69 6e 67 	movl   $0x676e6972,0x10(%eax)
 8049717:	c7 40 14 20 74 6f 6f 	movl   $0x6f6f7420,0x14(%eax)
 804971e:	c7 40 18 20 6c 61 72 	movl   $0x72616c20,0x18(%eax)
 8049725:	c7 40 1c 67 65 2e 20 	movl   $0x202e6567,0x1c(%eax)
 804972c:	c7 40 20 49 6e 63 72 	movl   $0x72636e49,0x20(%eax)
 8049733:	c7 40 24 65 61 73 65 	movl   $0x65736165,0x24(%eax)
 804973a:	c7 40 28 20 53 55 42 	movl   $0x42555320,0x28(%eax)
 8049741:	c7 40 2c 4d 49 54 52 	movl   $0x5254494d,0x2c(%eax)
 8049748:	c7 40 30 5f 4d 41 58 	movl   $0x58414d5f,0x30(%eax)
 804974f:	c7 40 34 42 55 46 00 	movl   $0x465542,0x34(%eax)
 8049756:	89 2c 24             	mov    %ebp,(%esp)
 8049759:	e8 92 f1 ff ff       	call   80488f0 <close@plt>
 804975e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049763:	e9 21 04 00 00       	jmp    8049b89 <submitr+0x706>
 8049768:	8d 94 24 60 20 00 00 	lea    0x2060(%esp),%edx
 804976f:	b9 00 08 00 00       	mov    $0x800,%ecx
 8049774:	b8 00 00 00 00       	mov    $0x0,%eax
 8049779:	89 d7                	mov    %edx,%edi
 804977b:	f3 ab                	rep stos %eax,%es:(%edi)
 804977d:	89 df                	mov    %ebx,%edi
 804977f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 8049784:	f2 ae                	repnz scas %es:(%edi),%al
 8049786:	f7 d1                	not    %ecx
 8049788:	83 e9 01             	sub    $0x1,%ecx
 804978b:	89 ce                	mov    %ecx,%esi
 804978d:	0f 84 0f 04 00 00    	je     8049ba2 <submitr+0x71f>
 8049793:	89 d7                	mov    %edx,%edi
 8049795:	0f b6 03             	movzbl (%ebx),%eax
 8049798:	3c 2a                	cmp    $0x2a,%al
 804979a:	74 21                	je     80497bd <submitr+0x33a>
 804979c:	8d 50 d3             	lea    -0x2d(%eax),%edx
 804979f:	80 fa 01             	cmp    $0x1,%dl
 80497a2:	76 19                	jbe    80497bd <submitr+0x33a>
 80497a4:	3c 5f                	cmp    $0x5f,%al
 80497a6:	74 15                	je     80497bd <submitr+0x33a>
 80497a8:	8d 50 d0             	lea    -0x30(%eax),%edx
 80497ab:	80 fa 09             	cmp    $0x9,%dl
 80497ae:	76 0d                	jbe    80497bd <submitr+0x33a>
 80497b0:	89 c2                	mov    %eax,%edx
 80497b2:	83 e2 df             	and    $0xffffffdf,%edx
 80497b5:	83 ea 41             	sub    $0x41,%edx
 80497b8:	80 fa 19             	cmp    $0x19,%dl
 80497bb:	77 07                	ja     80497c4 <submitr+0x341>
 80497bd:	8d 57 01             	lea    0x1(%edi),%edx
 80497c0:	88 07                	mov    %al,(%edi)
 80497c2:	eb 6d                	jmp    8049831 <submitr+0x3ae>
 80497c4:	3c 20                	cmp    $0x20,%al
 80497c6:	75 08                	jne    80497d0 <submitr+0x34d>
 80497c8:	8d 57 01             	lea    0x1(%edi),%edx
 80497cb:	c6 07 2b             	movb   $0x2b,(%edi)
 80497ce:	eb 61                	jmp    8049831 <submitr+0x3ae>
 80497d0:	8d 50 e0             	lea    -0x20(%eax),%edx
 80497d3:	80 fa 5f             	cmp    $0x5f,%dl
 80497d6:	76 08                	jbe    80497e0 <submitr+0x35d>
 80497d8:	3c 09                	cmp    $0x9,%al
 80497da:	0f 85 2d 04 00 00    	jne    8049c0d <submitr+0x78a>
 80497e0:	0f b6 c0             	movzbl %al,%eax
 80497e3:	89 44 24 10          	mov    %eax,0x10(%esp)
 80497e7:	c7 44 24 0c 94 a4 04 	movl   $0x804a494,0xc(%esp)
 80497ee:	08 
 80497ef:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
 80497f6:	00 
 80497f7:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80497fe:	00 
 80497ff:	8d 84 24 60 80 00 00 	lea    0x8060(%esp),%eax
 8049806:	89 04 24             	mov    %eax,(%esp)
 8049809:	e8 02 f1 ff ff       	call   8048910 <__sprintf_chk@plt>
 804980e:	0f b6 84 24 60 80 00 	movzbl 0x8060(%esp),%eax
 8049815:	00 
 8049816:	88 07                	mov    %al,(%edi)
 8049818:	0f b6 84 24 61 80 00 	movzbl 0x8061(%esp),%eax
 804981f:	00 
 8049820:	88 47 01             	mov    %al,0x1(%edi)
 8049823:	8d 57 03             	lea    0x3(%edi),%edx
 8049826:	0f b6 84 24 62 80 00 	movzbl 0x8062(%esp),%eax
 804982d:	00 
 804982e:	88 47 02             	mov    %al,0x2(%edi)
 8049831:	83 c3 01             	add    $0x1,%ebx
 8049834:	83 ee 01             	sub    $0x1,%esi
 8049837:	0f 84 65 03 00 00    	je     8049ba2 <submitr+0x71f>
 804983d:	89 d7                	mov    %edx,%edi
 804983f:	e9 51 ff ff ff       	jmp    8049795 <submitr+0x312>
 8049844:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 8049848:	89 74 24 04          	mov    %esi,0x4(%esp)
 804984c:	89 2c 24             	mov    %ebp,(%esp)
 804984f:	e8 fc ef ff ff       	call   8048850 <write@plt>
 8049854:	85 c0                	test   %eax,%eax
 8049856:	7f 0f                	jg     8049867 <submitr+0x3e4>
 8049858:	e8 23 f0 ff ff       	call   8048880 <__errno_location@plt>
 804985d:	83 38 04             	cmpl   $0x4,(%eax)
 8049860:	75 0f                	jne    8049871 <submitr+0x3ee>
 8049862:	b8 00 00 00 00       	mov    $0x0,%eax
 8049867:	01 c6                	add    %eax,%esi
 8049869:	29 c3                	sub    %eax,%ebx
 804986b:	75 d7                	jne    8049844 <submitr+0x3c1>
 804986d:	85 ff                	test   %edi,%edi
 804986f:	79 62                	jns    80498d3 <submitr+0x450>
 8049871:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049875:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 804987b:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 8049882:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 8049889:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 8049890:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 8049897:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 804989e:	c7 40 18 77 72 69 74 	movl   $0x74697277,0x18(%eax)
 80498a5:	c7 40 1c 65 20 74 6f 	movl   $0x6f742065,0x1c(%eax)
 80498ac:	c7 40 20 20 74 68 65 	movl   $0x65687420,0x20(%eax)
 80498b3:	c7 40 24 20 73 65 72 	movl   $0x72657320,0x24(%eax)
 80498ba:	c7 40 28 76 65 72 00 	movl   $0x726576,0x28(%eax)
 80498c1:	89 2c 24             	mov    %ebp,(%esp)
 80498c4:	e8 27 f0 ff ff       	call   80488f0 <close@plt>
 80498c9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80498ce:	e9 b6 02 00 00       	jmp    8049b89 <submitr+0x706>
 80498d3:	89 ac 24 60 80 00 00 	mov    %ebp,0x8060(%esp)
 80498da:	c7 84 24 64 80 00 00 	movl   $0x0,0x8064(%esp)
 80498e1:	00 00 00 00 
 80498e5:	8d 84 24 6c 80 00 00 	lea    0x806c(%esp),%eax
 80498ec:	89 84 24 68 80 00 00 	mov    %eax,0x8068(%esp)
 80498f3:	b9 00 20 00 00       	mov    $0x2000,%ecx
 80498f8:	8d 54 24 60          	lea    0x60(%esp),%edx
 80498fc:	8d 84 24 60 80 00 00 	lea    0x8060(%esp),%eax
 8049903:	e8 6c fa ff ff       	call   8049374 <rio_readlineb>
 8049908:	85 c0                	test   %eax,%eax
 804990a:	7f 76                	jg     8049982 <submitr+0x4ff>
 804990c:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049910:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 8049916:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 804991d:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 8049924:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 804992b:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 8049932:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 8049939:	c7 40 18 72 65 61 64 	movl   $0x64616572,0x18(%eax)
 8049940:	c7 40 1c 20 66 69 72 	movl   $0x72696620,0x1c(%eax)
 8049947:	c7 40 20 73 74 20 68 	movl   $0x68207473,0x20(%eax)
 804994e:	c7 40 24 65 61 64 65 	movl   $0x65646165,0x24(%eax)
 8049955:	c7 40 28 72 20 66 72 	movl   $0x72662072,0x28(%eax)
 804995c:	c7 40 2c 6f 6d 20 73 	movl   $0x73206d6f,0x2c(%eax)
 8049963:	c7 40 30 65 72 76 65 	movl   $0x65767265,0x30(%eax)
 804996a:	66 c7 40 34 72 00    	movw   $0x72,0x34(%eax)
 8049970:	89 2c 24             	mov    %ebp,(%esp)
 8049973:	e8 78 ef ff ff       	call   80488f0 <close@plt>
 8049978:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804997d:	e9 07 02 00 00       	jmp    8049b89 <submitr+0x706>
 8049982:	8d 84 24 60 60 00 00 	lea    0x6060(%esp),%eax
 8049989:	89 44 24 10          	mov    %eax,0x10(%esp)
 804998d:	8d 44 24 4c          	lea    0x4c(%esp),%eax
 8049991:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049995:	8d 84 24 60 40 00 00 	lea    0x4060(%esp),%eax
 804999c:	89 44 24 08          	mov    %eax,0x8(%esp)
 80499a0:	c7 44 24 04 9b a4 04 	movl   $0x804a49b,0x4(%esp)
 80499a7:	08 
 80499a8:	8d 44 24 60          	lea    0x60(%esp),%eax
 80499ac:	89 04 24             	mov    %eax,(%esp)
 80499af:	e8 ac ee ff ff       	call   8048860 <__isoc99_sscanf@plt>
 80499b4:	8b 44 24 4c          	mov    0x4c(%esp),%eax
 80499b8:	3d c8 00 00 00       	cmp    $0xc8,%eax
 80499bd:	0f 84 cb 00 00 00    	je     8049a8e <submitr+0x60b>
 80499c3:	8d 94 24 60 60 00 00 	lea    0x6060(%esp),%edx
 80499ca:	89 54 24 14          	mov    %edx,0x14(%esp)
 80499ce:	89 44 24 10          	mov    %eax,0x10(%esp)
 80499d2:	c7 44 24 0c ac a3 04 	movl   $0x804a3ac,0xc(%esp)
 80499d9:	08 
 80499da:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
 80499e1:	ff 
 80499e2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80499e9:	00 
 80499ea:	8b 44 24 34          	mov    0x34(%esp),%eax
 80499ee:	89 04 24             	mov    %eax,(%esp)
 80499f1:	e8 1a ef ff ff       	call   8048910 <__sprintf_chk@plt>
 80499f6:	89 2c 24             	mov    %ebp,(%esp)
 80499f9:	e8 f2 ee ff ff       	call   80488f0 <close@plt>
 80499fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049a03:	e9 81 01 00 00       	jmp    8049b89 <submitr+0x706>
 8049a08:	b9 00 20 00 00       	mov    $0x2000,%ecx
 8049a0d:	8d 54 24 60          	lea    0x60(%esp),%edx
 8049a11:	8d 84 24 60 80 00 00 	lea    0x8060(%esp),%eax
 8049a18:	e8 57 f9 ff ff       	call   8049374 <rio_readlineb>
 8049a1d:	85 c0                	test   %eax,%eax
 8049a1f:	7f 6d                	jg     8049a8e <submitr+0x60b>
 8049a21:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049a25:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 8049a2b:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 8049a32:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 8049a39:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 8049a40:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 8049a47:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 8049a4e:	c7 40 18 72 65 61 64 	movl   $0x64616572,0x18(%eax)
 8049a55:	c7 40 1c 20 68 65 61 	movl   $0x61656820,0x1c(%eax)
 8049a5c:	c7 40 20 64 65 72 73 	movl   $0x73726564,0x20(%eax)
 8049a63:	c7 40 24 20 66 72 6f 	movl   $0x6f726620,0x24(%eax)
 8049a6a:	c7 40 28 6d 20 73 65 	movl   $0x6573206d,0x28(%eax)
 8049a71:	c7 40 2c 72 76 65 72 	movl   $0x72657672,0x2c(%eax)
 8049a78:	c6 40 30 00          	movb   $0x0,0x30(%eax)
 8049a7c:	89 2c 24             	mov    %ebp,(%esp)
 8049a7f:	e8 6c ee ff ff       	call   80488f0 <close@plt>
 8049a84:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049a89:	e9 fb 00 00 00       	jmp    8049b89 <submitr+0x706>
 8049a8e:	80 7c 24 60 0d       	cmpb   $0xd,0x60(%esp)
 8049a93:	0f 85 6f ff ff ff    	jne    8049a08 <submitr+0x585>
 8049a99:	80 7c 24 61 0a       	cmpb   $0xa,0x61(%esp)
 8049a9e:	0f 85 64 ff ff ff    	jne    8049a08 <submitr+0x585>
 8049aa4:	80 7c 24 62 00       	cmpb   $0x0,0x62(%esp)
 8049aa9:	0f 85 59 ff ff ff    	jne    8049a08 <submitr+0x585>
 8049aaf:	b9 00 20 00 00       	mov    $0x2000,%ecx
 8049ab4:	8d 54 24 60          	lea    0x60(%esp),%edx
 8049ab8:	8d 84 24 60 80 00 00 	lea    0x8060(%esp),%eax
 8049abf:	e8 b0 f8 ff ff       	call   8049374 <rio_readlineb>
 8049ac4:	85 c0                	test   %eax,%eax
 8049ac6:	7f 74                	jg     8049b3c <submitr+0x6b9>
 8049ac8:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049acc:	c7 00 45 72 72 6f    	movl   $0x6f727245,(%eax)
 8049ad2:	c7 40 04 72 3a 20 43 	movl   $0x43203a72,0x4(%eax)
 8049ad9:	c7 40 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%eax)
 8049ae0:	c7 40 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%eax)
 8049ae7:	c7 40 10 61 62 6c 65 	movl   $0x656c6261,0x10(%eax)
 8049aee:	c7 40 14 20 74 6f 20 	movl   $0x206f7420,0x14(%eax)
 8049af5:	c7 40 18 72 65 61 64 	movl   $0x64616572,0x18(%eax)
 8049afc:	c7 40 1c 20 73 74 61 	movl   $0x61747320,0x1c(%eax)
 8049b03:	c7 40 20 74 75 73 20 	movl   $0x20737574,0x20(%eax)
 8049b0a:	c7 40 24 6d 65 73 73 	movl   $0x7373656d,0x24(%eax)
 8049b11:	c7 40 28 61 67 65 20 	movl   $0x20656761,0x28(%eax)
 8049b18:	c7 40 2c 66 72 6f 6d 	movl   $0x6d6f7266,0x2c(%eax)
 8049b1f:	c7 40 30 20 73 65 72 	movl   $0x72657320,0x30(%eax)
 8049b26:	c7 40 34 76 65 72 00 	movl   $0x726576,0x34(%eax)
 8049b2d:	89 2c 24             	mov    %ebp,(%esp)
 8049b30:	e8 bb ed ff ff       	call   80488f0 <close@plt>
 8049b35:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049b3a:	eb 4d                	jmp    8049b89 <submitr+0x706>
 8049b3c:	8d 44 24 60          	lea    0x60(%esp),%eax
 8049b40:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b44:	8b 74 24 34          	mov    0x34(%esp),%esi
 8049b48:	89 34 24             	mov    %esi,(%esp)
 8049b4b:	e8 80 ec ff ff       	call   80487d0 <strcpy@plt>
 8049b50:	89 2c 24             	mov    %ebp,(%esp)
 8049b53:	e8 98 ed ff ff       	call   80488f0 <close@plt>
 8049b58:	0f b6 06             	movzbl (%esi),%eax
 8049b5b:	ba 4f 00 00 00       	mov    $0x4f,%edx
 8049b60:	29 c2                	sub    %eax,%edx
 8049b62:	75 1b                	jne    8049b7f <submitr+0x6fc>
 8049b64:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049b68:	0f b6 40 01          	movzbl 0x1(%eax),%eax
 8049b6c:	ba 4b 00 00 00       	mov    $0x4b,%edx
 8049b71:	29 c2                	sub    %eax,%edx
 8049b73:	75 0a                	jne    8049b7f <submitr+0x6fc>
 8049b75:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049b79:	0f b6 50 02          	movzbl 0x2(%eax),%edx
 8049b7d:	f7 da                	neg    %edx
 8049b7f:	85 d2                	test   %edx,%edx
 8049b81:	0f 95 c0             	setne  %al
 8049b84:	0f b6 c0             	movzbl %al,%eax
 8049b87:	f7 d8                	neg    %eax
 8049b89:	8b 8c 24 6c a0 00 00 	mov    0xa06c(%esp),%ecx
 8049b90:	65 33 0d 14 00 00 00 	xor    %gs:0x14,%ecx
 8049b97:	0f 84 ef 00 00 00    	je     8049c8c <submitr+0x809>
 8049b9d:	e9 e5 00 00 00       	jmp    8049c87 <submitr+0x804>
 8049ba2:	8d 84 24 60 20 00 00 	lea    0x2060(%esp),%eax
 8049ba9:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 8049bad:	8b 44 24 30          	mov    0x30(%esp),%eax
 8049bb1:	89 44 24 18          	mov    %eax,0x18(%esp)
 8049bb5:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 8049bb9:	89 44 24 14          	mov    %eax,0x14(%esp)
 8049bbd:	8b 44 24 28          	mov    0x28(%esp),%eax
 8049bc1:	89 44 24 10          	mov    %eax,0x10(%esp)
 8049bc5:	c7 44 24 0c dc a3 04 	movl   $0x804a3dc,0xc(%esp)
 8049bcc:	08 
 8049bcd:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
 8049bd4:	00 
 8049bd5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049bdc:	00 
 8049bdd:	8d 7c 24 60          	lea    0x60(%esp),%edi
 8049be1:	89 3c 24             	mov    %edi,(%esp)
 8049be4:	e8 27 ed ff ff       	call   8048910 <__sprintf_chk@plt>
 8049be9:	b8 00 00 00 00       	mov    $0x0,%eax
 8049bee:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 8049bf3:	f2 ae                	repnz scas %es:(%edi),%al
 8049bf5:	f7 d1                	not    %ecx
 8049bf7:	83 e9 01             	sub    $0x1,%ecx
 8049bfa:	89 cf                	mov    %ecx,%edi
 8049bfc:	0f 84 d1 fc ff ff    	je     80498d3 <submitr+0x450>
 8049c02:	89 cb                	mov    %ecx,%ebx
 8049c04:	8d 74 24 60          	lea    0x60(%esp),%esi
 8049c08:	e9 37 fc ff ff       	jmp    8049844 <submitr+0x3c1>
 8049c0d:	8b 4c 24 34          	mov    0x34(%esp),%ecx
 8049c11:	89 cf                	mov    %ecx,%edi
 8049c13:	be 28 a4 04 08       	mov    $0x804a428,%esi
 8049c18:	b8 43 00 00 00       	mov    $0x43,%eax
 8049c1d:	f6 c1 01             	test   $0x1,%cl
 8049c20:	74 16                	je     8049c38 <submitr+0x7b5>
 8049c22:	0f b6 05 28 a4 04 08 	movzbl 0x804a428,%eax
 8049c29:	88 01                	mov    %al,(%ecx)
 8049c2b:	8d 79 01             	lea    0x1(%ecx),%edi
 8049c2e:	be 29 a4 04 08       	mov    $0x804a429,%esi
 8049c33:	b8 42 00 00 00       	mov    $0x42,%eax
 8049c38:	f7 c7 02 00 00 00    	test   $0x2,%edi
 8049c3e:	74 0f                	je     8049c4f <submitr+0x7cc>
 8049c40:	0f b7 16             	movzwl (%esi),%edx
 8049c43:	66 89 17             	mov    %dx,(%edi)
 8049c46:	83 c7 02             	add    $0x2,%edi
 8049c49:	83 c6 02             	add    $0x2,%esi
 8049c4c:	83 e8 02             	sub    $0x2,%eax
 8049c4f:	89 c1                	mov    %eax,%ecx
 8049c51:	c1 e9 02             	shr    $0x2,%ecx
 8049c54:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 8049c56:	ba 00 00 00 00       	mov    $0x0,%edx
 8049c5b:	a8 02                	test   $0x2,%al
 8049c5d:	74 0b                	je     8049c6a <submitr+0x7e7>
 8049c5f:	0f b7 16             	movzwl (%esi),%edx
 8049c62:	66 89 17             	mov    %dx,(%edi)
 8049c65:	ba 02 00 00 00       	mov    $0x2,%edx
 8049c6a:	a8 01                	test   $0x1,%al
 8049c6c:	74 07                	je     8049c75 <submitr+0x7f2>
 8049c6e:	0f b6 04 16          	movzbl (%esi,%edx,1),%eax
 8049c72:	88 04 17             	mov    %al,(%edi,%edx,1)
 8049c75:	89 2c 24             	mov    %ebp,(%esp)
 8049c78:	e8 73 ec ff ff       	call   80488f0 <close@plt>
 8049c7d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049c82:	e9 02 ff ff ff       	jmp    8049b89 <submitr+0x706>
 8049c87:	e8 34 eb ff ff       	call   80487c0 <__stack_chk_fail@plt>
 8049c8c:	81 c4 7c a0 00 00    	add    $0xa07c,%esp
 8049c92:	5b                   	pop    %ebx
 8049c93:	5e                   	pop    %esi
 8049c94:	5f                   	pop    %edi
 8049c95:	5d                   	pop    %ebp
 8049c96:	c3                   	ret    

08049c97 <init_timeout>:
 8049c97:	53                   	push   %ebx
 8049c98:	83 ec 18             	sub    $0x18,%esp
 8049c9b:	8b 5c 24 20          	mov    0x20(%esp),%ebx
 8049c9f:	85 db                	test   %ebx,%ebx
 8049ca1:	74 26                	je     8049cc9 <init_timeout+0x32>
 8049ca3:	c7 44 24 04 40 93 04 	movl   $0x8049340,0x4(%esp)
 8049caa:	08 
 8049cab:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
 8049cb2:	e8 d9 ea ff ff       	call   8048790 <signal@plt>
 8049cb7:	85 db                	test   %ebx,%ebx
 8049cb9:	b8 00 00 00 00       	mov    $0x0,%eax
 8049cbe:	0f 48 d8             	cmovs  %eax,%ebx
 8049cc1:	89 1c 24             	mov    %ebx,(%esp)
 8049cc4:	e8 e7 ea ff ff       	call   80487b0 <alarm@plt>
 8049cc9:	83 c4 18             	add    $0x18,%esp
 8049ccc:	5b                   	pop    %ebx
 8049ccd:	c3                   	ret    

08049cce <init_driver>:
 8049cce:	57                   	push   %edi
 8049ccf:	56                   	push   %esi
 8049cd0:	53                   	push   %ebx
 8049cd1:	83 ec 40             	sub    $0x40,%esp
 8049cd4:	8b 74 24 50          	mov    0x50(%esp),%esi
 8049cd8:	65 a1 14 00 00 00    	mov    %gs:0x14,%eax
 8049cde:	89 44 24 3c          	mov    %eax,0x3c(%esp)
 8049ce2:	31 c0                	xor    %eax,%eax
 8049ce4:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049ceb:	00 
 8049cec:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
 8049cf3:	e8 98 ea ff ff       	call   8048790 <signal@plt>
 8049cf8:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049cff:	00 
 8049d00:	c7 04 24 1d 00 00 00 	movl   $0x1d,(%esp)
 8049d07:	e8 84 ea ff ff       	call   8048790 <signal@plt>
 8049d0c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049d13:	00 
 8049d14:	c7 04 24 1d 00 00 00 	movl   $0x1d,(%esp)
 8049d1b:	e8 70 ea ff ff       	call   8048790 <signal@plt>
 8049d20:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 8049d27:	00 
 8049d28:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049d2f:	00 
 8049d30:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 8049d37:	e8 64 eb ff ff       	call   80488a0 <socket@plt>
 8049d3c:	89 c3                	mov    %eax,%ebx
 8049d3e:	85 c0                	test   %eax,%eax
 8049d40:	79 4e                	jns    8049d90 <init_driver+0xc2>
 8049d42:	c7 06 45 72 72 6f    	movl   $0x6f727245,(%esi)
 8049d48:	c7 46 04 72 3a 20 43 	movl   $0x43203a72,0x4(%esi)
 8049d4f:	c7 46 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%esi)
 8049d56:	c7 46 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%esi)
 8049d5d:	c7 46 10 61 62 6c 65 	movl   $0x656c6261,0x10(%esi)
 8049d64:	c7 46 14 20 74 6f 20 	movl   $0x206f7420,0x14(%esi)
 8049d6b:	c7 46 18 63 72 65 61 	movl   $0x61657263,0x18(%esi)
 8049d72:	c7 46 1c 74 65 20 73 	movl   $0x73206574,0x1c(%esi)
 8049d79:	c7 46 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%esi)
 8049d80:	66 c7 46 24 74 00    	movw   $0x74,0x24(%esi)
 8049d86:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049d8b:	e9 33 01 00 00       	jmp    8049ec3 <init_driver+0x1f5>
 8049d90:	c7 04 24 ac a4 04 08 	movl   $0x804a4ac,(%esp)
 8049d97:	e8 24 eb ff ff       	call   80488c0 <gethostbyname@plt>
 8049d9c:	85 c0                	test   %eax,%eax
 8049d9e:	75 68                	jne    8049e08 <init_driver+0x13a>
 8049da0:	c7 06 45 72 72 6f    	movl   $0x6f727245,(%esi)
 8049da6:	c7 46 04 72 3a 20 44 	movl   $0x44203a72,0x4(%esi)
 8049dad:	c7 46 08 4e 53 20 69 	movl   $0x6920534e,0x8(%esi)
 8049db4:	c7 46 0c 73 20 75 6e 	movl   $0x6e752073,0xc(%esi)
 8049dbb:	c7 46 10 61 62 6c 65 	movl   $0x656c6261,0x10(%esi)
 8049dc2:	c7 46 14 20 74 6f 20 	movl   $0x206f7420,0x14(%esi)
 8049dc9:	c7 46 18 72 65 73 6f 	movl   $0x6f736572,0x18(%esi)
 8049dd0:	c7 46 1c 6c 76 65 20 	movl   $0x2065766c,0x1c(%esi)
 8049dd7:	c7 46 20 73 65 72 76 	movl   $0x76726573,0x20(%esi)
 8049dde:	c7 46 24 65 72 20 61 	movl   $0x61207265,0x24(%esi)
 8049de5:	c7 46 28 64 64 72 65 	movl   $0x65726464,0x28(%esi)
 8049dec:	66 c7 46 2c 73 73    	movw   $0x7373,0x2c(%esi)
 8049df2:	c6 46 2e 00          	movb   $0x0,0x2e(%esi)
 8049df6:	89 1c 24             	mov    %ebx,(%esp)
 8049df9:	e8 f2 ea ff ff       	call   80488f0 <close@plt>
 8049dfe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049e03:	e9 bb 00 00 00       	jmp    8049ec3 <init_driver+0x1f5>
 8049e08:	8d 7c 24 2c          	lea    0x2c(%esp),%edi
 8049e0c:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 8049e13:	00 
 8049e14:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
 8049e1b:	00 
 8049e1c:	c7 44 24 34 00 00 00 	movl   $0x0,0x34(%esp)
 8049e23:	00 
 8049e24:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
 8049e2b:	00 
 8049e2c:	66 c7 44 24 2c 02 00 	movw   $0x2,0x2c(%esp)
 8049e33:	c7 44 24 0c 0c 00 00 	movl   $0xc,0xc(%esp)
 8049e3a:	00 
 8049e3b:	8b 50 0c             	mov    0xc(%eax),%edx
 8049e3e:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049e42:	8b 40 10             	mov    0x10(%eax),%eax
 8049e45:	8b 00                	mov    (%eax),%eax
 8049e47:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049e4b:	8d 44 24 30          	lea    0x30(%esp),%eax
 8049e4f:	89 04 24             	mov    %eax,(%esp)
 8049e52:	e8 a9 e9 ff ff       	call   8048800 <__memmove_chk@plt>
 8049e57:	66 c7 44 24 2e 3b 6e 	movw   $0x6e3b,0x2e(%esp)
 8049e5e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 8049e65:	00 
 8049e66:	89 7c 24 04          	mov    %edi,0x4(%esp)
 8049e6a:	89 1c 24             	mov    %ebx,(%esp)
 8049e6d:	e8 6e ea ff ff       	call   80488e0 <connect@plt>
 8049e72:	85 c0                	test   %eax,%eax
 8049e74:	79 37                	jns    8049ead <init_driver+0x1df>
 8049e76:	c7 44 24 10 ac a4 04 	movl   $0x804a4ac,0x10(%esp)
 8049e7d:	08 
 8049e7e:	c7 44 24 0c 6c a4 04 	movl   $0x804a46c,0xc(%esp)
 8049e85:	08 
 8049e86:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
 8049e8d:	ff 
 8049e8e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049e95:	00 
 8049e96:	89 34 24             	mov    %esi,(%esp)
 8049e99:	e8 72 ea ff ff       	call   8048910 <__sprintf_chk@plt>
 8049e9e:	89 1c 24             	mov    %ebx,(%esp)
 8049ea1:	e8 4a ea ff ff       	call   80488f0 <close@plt>
 8049ea6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049eab:	eb 16                	jmp    8049ec3 <init_driver+0x1f5>
 8049ead:	89 1c 24             	mov    %ebx,(%esp)
 8049eb0:	e8 3b ea ff ff       	call   80488f0 <close@plt>
 8049eb5:	66 c7 06 4f 4b       	movw   $0x4b4f,(%esi)
 8049eba:	c6 46 02 00          	movb   $0x0,0x2(%esi)
 8049ebe:	b8 00 00 00 00       	mov    $0x0,%eax
 8049ec3:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
 8049ec7:	65 33 0d 14 00 00 00 	xor    %gs:0x14,%ecx
 8049ece:	74 05                	je     8049ed5 <init_driver+0x207>
 8049ed0:	e8 eb e8 ff ff       	call   80487c0 <__stack_chk_fail@plt>
 8049ed5:	83 c4 40             	add    $0x40,%esp
 8049ed8:	5b                   	pop    %ebx
 8049ed9:	5e                   	pop    %esi
 8049eda:	5f                   	pop    %edi
 8049edb:	c3                   	ret    

08049edc <driver_post>:
 8049edc:	53                   	push   %ebx
 8049edd:	83 ec 28             	sub    $0x28,%esp
 8049ee0:	8b 44 24 30          	mov    0x30(%esp),%eax
 8049ee4:	8b 5c 24 3c          	mov    0x3c(%esp),%ebx
 8049ee8:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
 8049eed:	74 2c                	je     8049f1b <driver_post+0x3f>
 8049eef:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049ef3:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049ef7:	c7 44 24 04 ba a4 04 	movl   $0x804a4ba,0x4(%esp)
 8049efe:	08 
 8049eff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8049f06:	e8 85 e9 ff ff       	call   8048890 <__printf_chk@plt>
 8049f0b:	66 c7 03 4f 4b       	movw   $0x4b4f,(%ebx)
 8049f10:	c6 43 02 00          	movb   $0x0,0x2(%ebx)
 8049f14:	b8 00 00 00 00       	mov    $0x0,%eax
 8049f19:	eb 4d                	jmp    8049f68 <driver_post+0x8c>
 8049f1b:	85 c0                	test   %eax,%eax
 8049f1d:	74 3b                	je     8049f5a <driver_post+0x7e>
 8049f1f:	80 38 00             	cmpb   $0x0,(%eax)
 8049f22:	74 36                	je     8049f5a <driver_post+0x7e>
 8049f24:	89 5c 24 18          	mov    %ebx,0x18(%esp)
 8049f28:	8b 54 24 34          	mov    0x34(%esp),%edx
 8049f2c:	89 54 24 14          	mov    %edx,0x14(%esp)
 8049f30:	c7 44 24 10 d1 a4 04 	movl   $0x804a4d1,0x10(%esp)
 8049f37:	08 
 8049f38:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049f3c:	c7 44 24 08 d9 a4 04 	movl   $0x804a4d9,0x8(%esp)
 8049f43:	08 
 8049f44:	c7 44 24 04 6e 3b 00 	movl   $0x3b6e,0x4(%esp)
 8049f4b:	00 
 8049f4c:	c7 04 24 ac a4 04 08 	movl   $0x804a4ac,(%esp)
 8049f53:	e8 2b f5 ff ff       	call   8049483 <submitr>
 8049f58:	eb 0e                	jmp    8049f68 <driver_post+0x8c>
 8049f5a:	66 c7 03 4f 4b       	movw   $0x4b4f,(%ebx)
 8049f5f:	c6 43 02 00          	movb   $0x0,0x2(%ebx)
 8049f63:	b8 00 00 00 00       	mov    $0x0,%eax
 8049f68:	83 c4 28             	add    $0x28,%esp
 8049f6b:	5b                   	pop    %ebx
 8049f6c:	c3                   	ret    
 8049f6d:	66 90                	xchg   %ax,%ax
 8049f6f:	90                   	nop

08049f70 <__libc_csu_init>:
 8049f70:	55                   	push   %ebp
 8049f71:	57                   	push   %edi
 8049f72:	31 ff                	xor    %edi,%edi
 8049f74:	56                   	push   %esi
 8049f75:	53                   	push   %ebx
 8049f76:	e8 d5 e9 ff ff       	call   8048950 <__x86.get_pc_thunk.bx>
 8049f7b:	81 c3 85 20 00 00    	add    $0x2085,%ebx
 8049f81:	83 ec 1c             	sub    $0x1c,%esp
 8049f84:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 8049f88:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 8049f8e:	e8 91 e7 ff ff       	call   8048724 <_init>
 8049f93:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 8049f99:	29 c6                	sub    %eax,%esi
 8049f9b:	c1 fe 02             	sar    $0x2,%esi
 8049f9e:	85 f6                	test   %esi,%esi
 8049fa0:	74 27                	je     8049fc9 <__libc_csu_init+0x59>
 8049fa2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049fa8:	8b 44 24 38          	mov    0x38(%esp),%eax
 8049fac:	89 2c 24             	mov    %ebp,(%esp)
 8049faf:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049fb3:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049fb7:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049fbb:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 8049fc2:	83 c7 01             	add    $0x1,%edi
 8049fc5:	39 f7                	cmp    %esi,%edi
 8049fc7:	75 df                	jne    8049fa8 <__libc_csu_init+0x38>
 8049fc9:	83 c4 1c             	add    $0x1c,%esp
 8049fcc:	5b                   	pop    %ebx
 8049fcd:	5e                   	pop    %esi
 8049fce:	5f                   	pop    %edi
 8049fcf:	5d                   	pop    %ebp
 8049fd0:	c3                   	ret    
 8049fd1:	eb 0d                	jmp    8049fe0 <__libc_csu_fini>
 8049fd3:	90                   	nop
 8049fd4:	90                   	nop
 8049fd5:	90                   	nop
 8049fd6:	90                   	nop
 8049fd7:	90                   	nop
 8049fd8:	90                   	nop
 8049fd9:	90                   	nop
 8049fda:	90                   	nop
 8049fdb:	90                   	nop
 8049fdc:	90                   	nop
 8049fdd:	90                   	nop
 8049fde:	90                   	nop
 8049fdf:	90                   	nop

08049fe0 <__libc_csu_fini>:
 8049fe0:	f3 c3                	repz ret 

Disassembly of section .fini:

08049fe4 <_fini>:
 8049fe4:	53                   	push   %ebx
 8049fe5:	83 ec 08             	sub    $0x8,%esp
 8049fe8:	e8 63 e9 ff ff       	call   8048950 <__x86.get_pc_thunk.bx>
 8049fed:	81 c3 13 20 00 00    	add    $0x2013,%ebx
 8049ff3:	83 c4 08             	add    $0x8,%esp
 8049ff6:	5b                   	pop    %ebx
 8049ff7:	c3                   	ret    
