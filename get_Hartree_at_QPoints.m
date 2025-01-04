function  VH_new=get_Hartree_at_QPoints(VH,T,gauss_type,bas_val)

    num_of_element = size(T,2);
    VH_new = zeros(num_of_element, gauss_type); 
    for e = 1:num_of_element % 按单元扫描    
        VH_new(e,:) = VH(T(:,e))'*bas_val;
    end

end