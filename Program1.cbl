000100 program-id. Program1 as "SentinelLinkedLists.Program1".
000200
000300 data division.
000400 working-storage section.
000500
000600* All algorithms in these programs are from "Essential Algorithms", by Rod Stephens.
000700*This program builds singly linked lists with a sentinel.
000800 01 inputnum pic s9(9) value zero.
000900 01 topindex pic s9(9) value zero.
001000 01 inputnum_save pic s9(9) value zero.
001100 01 new_cell_list_pointer usage is pointer.
       01 new_cell_list_pointer_save usage is pointer.
001200 01 list-item.
001300   05 list_item_data pic x(80) occurs 100 times indexed by topindex.
001400   05 next-item-list-pointer usage is pointer occurs 100 times indexed by topindex value is null.
001500 01 top_list.
001600   05 top_data pic x(80) occurs 100 times indexed by topindex.
001700   05 top_next usage is pointer occurs 100 times indexed by topindex value is null.
001800 01 next_top_list.
001900   05 next_top_data pic x(80) occurs 100 times indexed by topindex.
002000   05 next_top_next usage is pointer occurs 100 times indexed by topindex value is null.
002100 01 anykey pic x(80).
002200 01 Targ external pic x(80).
002300 01 target_data pic x(80).
002400 01 sentinel_cell usage is pointer occurs 100 times indexed by topindex value is null.
       01 new_cell.
         05 new_cell_data pic x(80) occurs 100 times indexed by topindex.
         05 new_cell_pointer usage is pointer occurs 100 times indexed by topindex value is null.

          

002500 linkage section.
002600 procedure division.
           allocate length of next-item-list-pointer characters loc 31 returning new_cell_list_pointer.
           move new_cell_list_pointer to sentinel_cell[0].
           display "Enter a number".
           accept inputnum.
           move inputnum to inputnum_save.

           display "The number entered is " inputnum.

           perform until inputnum is zero
               allocate length of list-item CHARACTERS loc 31 returning new_cell_list_pointer
               move new_cell_list_pointer to next-item-list-pointer[inputnum]
               display 'Enter a Value for the list'
               accept anykey
               move anykey to list_item_data[inputnum]
               display list_item_data[inputnum]
               display "Press any key to continue"
               accept anykey

               if inputnum is equal to inputnum_save then
                   move new_cell_list_pointer to sentinel_cell[0]
               end-if
               subtract 1 from inputnum
           end-perform.


      * This code segment add a cell at the beginning of the linked list.
           allocate length of new_cell characters loc 31 returning new_cell_list_pointer.
           move new_cell_list_pointer to new_cell_list_pointer_save.
           move next-item-list-pointer[inputnum_save] to sentinel_cell[0].
           move sentinel_cell[0] to new_cell_pointer[0].
           display "Enter a data value for the new cell."
           accept target_data.
           move target_data to new_cell_data[0].
           move target_data to list_item_data[0].
      * This code segment add a cell at the end of the linked list.
           allocate length of new_cell characters loc 31 returning new_cell_list_pointer.

      * Find the last cell
           move inputnum_save to inputnum.
           add 1 to inputnum.
           add 1 to inputnum_save.

           perform until inputnum is zero
               move sentinel_cell[inputnum] to sentinel_cell[0]
               subtract 1 from inputnum
           end-perform.
           .
           move new_cell_list_pointer to sentinel_cell[inputnum].
           move sentinel_cell[0] to new_cell_list_pointer.
           display "Enter a data value for the last cell."
           accept target_data.
           move target_data to list_item_data[inputnum_save].
           display "Here are the linked list values."
           move inputnum_save to inputnum.
           add 1 to inputnum.
           add 1 to inputnum_save.
           perform until inputnum is zero
               display list_item_data[inputnum]
               subtract 1 from inputnum
               display "Press any key to continue."
               accept anykey
           end-perform
      
002700
002800
002900     goback.
003000     
003100 end program Program1.
