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
    
    public partial class Телефоны
    {
        public Телефоны()
        {
            this.Разговоры = new HashSet<Разговоры>();
        }
    
        public int IdТелефона { get; set; }
        public string Номер_Телефона { get; set; }
        public string Номер_договора { get; set; }
        public Nullable<System.DateTime> Дата_Установки_телефона { get; set; }
        public Nullable<int> idАбонента { get; set; }
    
        public virtual Абоненты Абоненты { get; set; }
        public virtual ICollection<Разговоры> Разговоры { get; set; }
    }
}
