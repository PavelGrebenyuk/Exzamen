//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfApp1
{
    using System;
    using System.Collections.Generic;
    
    public partial class Тарифы
    {
        public Тарифы()
        {
            this.Разговоры = new HashSet<Разговоры>();
        }
    
        public int IdТарифа { get; set; }
        public Nullable<int> Код_Города { get; set; }
        public string Название_Города { get; set; }
        public Nullable<int> Тариф_Стоимость_1_мин { get; set; }
        public string Признак_оплаты { get; set; }
    
        public virtual ICollection<Разговоры> Разговоры { get; set; }
    }
}
