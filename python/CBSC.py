import math
#decimal to bn, return bn in str format
def dec2bn_str(x: int, bw: int):
    x_bn_str=str(bin(x)) # example as x=6, bw=8, x_bn_str= '0b110'
    x_bn_str=x_bn_str[2:len(x_bn_str)] #x_bn_str= '110'
    x_bn_str= '0'*(bw - math.ceil(math.log2(x))) + x_bn_str  #x_bn_str='00000110'
    return x_bn_str

#%%
#return fake stochastic sequence
def FSM_SNG(bw: int=8):
    sng_index_sequence=[]
    for i in range (2**bw):
        if i % 2 == 0:  # i starts with 0
            sng_index_sequence.append(0)
        elif i % 4 == 1:
            sng_index_sequence.append(1)
        elif i % 8 == 3:
            sng_index_sequence.append(2)
        elif i % 16 == 7:
            sng_index_sequence.append(3)
        elif i % 32 == 15:
            sng_index_sequence.append(4)
        elif i % 64 == 31:
            sng_index_sequence.append(5)
        elif i % 128 == 63:
            sng_index_sequence.append(6)
        elif i % 256 == 127:
            sng_index_sequence.append(7)
    return sng_index_sequence



#%%
def CBSC_mul(x:int, w:int):
    x_bn_str=dec2bn_str(x, bw=8) #convert x from decimal to binary 
    sng_index_seq=FSM_SNG(bw=8) #generate randome sequence
    x_sn = [int(x_bn_str[i]) for i in sng_index_seq] # convert x_bn to x_sn
    #counting based SC multiplication
    cbsc_mul_product=sum(x_sn[0:w])
    
    return cbsc_mul_product


#%%
#p=CBSC_mul(x=127,w=127)    
    
    
    
    
    
    
    
