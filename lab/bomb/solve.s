
phase_1(rdi){
  esi=$0x402400;
  eax=strings_not_equal(rdi,esi);
  if(eax!=0) explode_bomb();
  retq;
  // ans="Border relations with Canada have never been better."
}



phase_2(rdi){

  rsi=rsp;
  read_six_numbers();
  if(*rsp!=1) explode_bomb();
  else goto 400f30;

400f17:
  eax=*(rbx-4);  
  eax+=eax; 
  if(*rbx==eax)  goto 400f25;
  else explode_bomb();

400f25:
  rbx+=4;
  if(rbx!=rbp) goto 400f17;
  else goto 400f3c

400f30:
  rbx=rsp+4;  
  rbp=rsp+24;  
  goto 400f17;

400f3c:
  ret;
}

phase_2(rdi){
  rsi=rsp;
  read_six_numbers();
  if(*rsp!=1) explode_bomb();
  rbx=rsp+4; 
  rbp=rsp+24;
  do{
    eax=*(rbx-4);
    eax+=eax; // eax=1 2 4 8 16 32 == *rbx 
    if(*rbx!=eax) explode_bomb();
    else rbx+=4;
  }while(rbx!=rbp);
  retq;
}

0000000000400f43 <phase_3>:
  400f43:	48 83 ec 18          	sub    $0x18,%rsp
  400f47:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
  400f4c:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  400f51:	be cf 25 40 00       	mov    $0x4025cf,%esi
  400f56:	b8 00 00 00 00       	mov    $0x0,%eax
  400f5b:	e8 90 fc ff ff       	callq  400bf0 <__isoc99_sscanf@plt>
  400f60:	83 f8 01             	cmp    $0x1,%eax
  400f63:	7f 05                	jg     400f6a <phase_3+0x27>
  400f65:	e8 d0 04 00 00       	callq  40143a <explode_bomb>
  400f6a:	83 7c 24 08 07       	cmpl   $0x7,0x8(%rsp)
  400f6f:	77 3c                	ja     400fad <phase_3+0x6a>
  400f71:	8b 44 24 08          	mov    0x8(%rsp),%eax
  400f75:	ff 24 c5 70 24 40 00 	jmpq   *0x402470(,%rax,8)
  400f7c:	b8 cf 00 00 00       	mov    $0xcf,%eax
  400f81:	eb 3b                	jmp    400fbe <phase_3+0x7b>
  400f83:	b8 c3 02 00 00       	mov    $0x2c3,%eax
  400f88:	eb 34                	jmp    400fbe <phase_3+0x7b>
  400f8a:	b8 00 01 00 00       	mov    $0x100,%eax
  400f8f:	eb 2d                	jmp    400fbe <phase_3+0x7b>
  400f91:	b8 85 01 00 00       	mov    $0x185,%eax
  400f96:	eb 26                	jmp    400fbe <phase_3+0x7b>
  400f98:	b8 ce 00 00 00       	mov    $0xce,%eax
  400f9d:	eb 1f                	jmp    400fbe <phase_3+0x7b>
  400f9f:	b8 aa 02 00 00       	mov    $0x2aa,%eax
  400fa4:	eb 18                	jmp    400fbe <phase_3+0x7b>
  400fa6:	b8 47 01 00 00       	mov    $0x147,%eax
  400fab:	eb 11                	jmp    400fbe <phase_3+0x7b>
  400fad:	e8 88 04 00 00       	callq  40143a <explode_bomb>
  400fb2:	b8 00 00 00 00       	mov    $0x0,%eax
  400fb7:	eb 05                	jmp    400fbe <phase_3+0x7b>
  400fb9:	b8 37 01 00 00       	mov    $0x137,%eax
  400fbe:	3b 44 24 0c          	cmp    0xc(%rsp),%eax
  400fc2:	74 05                	je     400fc9 <phase_3+0x86>
  400fc4:	e8 71 04 00 00       	callq  40143a <explode_bomb>
  400fc9:	48 83 c4 18          	add    $0x18,%rsp
  400fcd:	c3                   	retq   

phase_3(rdi){
  rcx=rsp+0xc;
  rdx=rsp+0x8;
  esi=0x4025cf;
  eax=0;
  sscanf(rdi,esi,rdx,rcx);
  if(eax-0x1<=0) explode_bomb();
  if(*(rsp+0x8)-0x7>0) explode_bomb();
  eax=rsp+0x8;
  goto *(0x402470+8*rax);
400f7c:
  eax=0xcf;
  goto 400fbe;
400f83:
  eax=0x2c3;
  goto 400fbe;
400f8a:
  eax=0x100;
  goto 400fbe;
400f91:
  eax=0x185;
  goto 400fbe;
400f98:
  eax=0xce;
  goto 400fbe;
400f9f:
  eax=0x2aa;
  goto 400fbe;
400fa6:
  eax=0x147;
  goto 400fbe;
  eax=0;
  goto 400fbe;
400fb9:
  eax=0x137;
400fbe:
  if(eax!=*(rsp+0xc)) explode_bomb();
  retq;

}

000000000040100c <phase_4>:
  40100c:	48 83 ec 18          	sub    $0x18,%rsp
  401010:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
  401015:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  40101a:	be cf 25 40 00       	mov    $0x4025cf,%esi
  40101f:	b8 00 00 00 00       	mov    $0x0,%eax
  401024:	e8 c7 fb ff ff       	callq  400bf0 <__isoc99_sscanf@plt>
  401029:	83 f8 02             	cmp    $0x2,%eax
  40102c:	75 07                	jne    401035 <phase_4+0x29>
  40102e:	83 7c 24 08 0e       	cmpl   $0xe,0x8(%rsp)
  401033:	76 05                	jbe    40103a <phase_4+0x2e>
  401035:	e8 00 04 00 00       	callq  40143a <explode_bomb>
  40103a:	ba 0e 00 00 00       	mov    $0xe,%edx
  40103f:	be 00 00 00 00       	mov    $0x0,%esi
  401044:	8b 7c 24 08          	mov    0x8(%rsp),%edi
  401048:	e8 81 ff ff ff       	callq  400fce <func4>
  40104d:	85 c0                	test   %eax,%eax
  40104f:	75 07                	jne    401058 <phase_4+0x4c>
  401051:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%rsp)
  401056:	74 05                	je     40105d <phase_4+0x51>
  401058:	e8 dd 03 00 00       	callq  40143a <explode_bomb>
  40105d:	48 83 c4 18          	add    $0x18,%rsp
  401061:	c3                   	retq   

phase_4(rdi){
  rcx=rsp+0xc;
  rdx=rsp+0x8;
  esi=$0x4025cf;
  eax=0;
  eax=sscanf(rdi,esi,rdx,rcx);
  if(eax!=2) explode_bomb();
  if(*(rsp+0x8)<=0xe){
    edx=0xe;
    esi=0;
    edi=*(rsp+0x8);
    rax=func4(edi,esi,edx);
    if(eax!=0) explode_bomb();
    if(*(rsp+0xc)!=0) explode_bomb();
  } 
}
func4(edi,esi,edx){
  eax=edx-esi;
  eax=(eax+eax>>31)>>1;
  ecx=rax+rsi;
  if(ecx<=edi){
    eax=0;
    if(ecx>=edi){
      return ;
    }
    esi=rcx+1;
    rax=func4(edi,esi,edx);
    eax=rax+rax+1;
  }else{
    edx=rcx-1;
    rax=func4(edi,esi,edx);
    eax+=eax;
  }
}