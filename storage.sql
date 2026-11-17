-- ที่เก็บรูปสินค้า (รันเพิ่มได้ ถ้ารัน setup.sql ไปแล้วก่อนหน้านี้)
insert into storage.buckets(id,name,public) values('products','products',true) on conflict (id) do nothing;
create policy "img read" on storage.objects for select using (bucket_id='products');
create policy "img ins" on storage.objects for insert with check (bucket_id='products' and public.is_admin());
create policy "img upd" on storage.objects for update using (bucket_id='products' and public.is_admin());
create policy "img del" on storage.objects for delete using (bucket_id='products' and public.is_admin());
